<?php

namespace App\Filament\Resources;

use App\Exports\SlotTimeExport;
use App\Filament\Resources\SlotTimeResource\Pages;
use App\Filament\Resources\SlotTimeResource\RelationManagers;
use App\Models\Doctor;
use App\Models\Slot;
use App\Models\SlotTime;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TimePicker;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Notifications\Collection;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\BulkAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use PharIo\Manifest\ElementCollection;

class SlotTimeResource extends Resource
{
    protected static ?string $model = SlotTime::class;

    protected static ?string $navigationIcon = 'heroicon-o-clock';

    public static function form(Form $form): Form
    {

        return $form
            ->schema([

                // Select::make('doctor_id')
                //     ->relationship('slot.doctor', 'name')
                //     ->label("choose Doctor"),
                Card::make()
                    ->schema([
                        Select::make('doctor_id')
                    ->options(Slot::with('doctor')->get()->pluck('doctor.name', 'doctor.id'))
                    // ->relationship('slot', 'doctor_id')
                    ->label("choose Doctor")
                    ->required()
                    ->reactive(),

                    Select::make('slot_id')
                    ->options(function (callable $get) {
                        $docid = $get('doctor_id');
                        if ($docid) {
                            return Slot::where('doctor_id', $docid)->pluck('date', 'id')->toArray();
                        }
                    })
                    // ->relationship('slot', 'date')
                    ->label("choose your Date")
                    ->required(),
                    ])->columns(2),

                

               

                TimePicker::make('time')
                    ->datalist([
                        '10:00',
                        '10:30',
                        '11:00',
                        '11:30',
                        '12:00',
                        '12:30',
                        '13:00',
                        '15:00',
                        '15:30',
                        '16:00',
                        '16:30',
                        '17:00',
                        '17:30',
                        '18:00',
                        '18:30',
                        '19:00',
                        '19:30',
                        '20:00',
                    ])
                    ->label('pick your available Time')
                    ->seconds(false)
                    ->required(),

                Toggle::make('is_available')
                    ->onColor('success')
                    ->offColor('danger')
                    ->inline(false)
                    ->label('Is the Doctor available in the above selected date?'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('slot.doctor.name')
                    ->sortable()
                    ->searchable(),
                TextColumn::make('slot.date')
                    ->sortable()
                    ->searchable(),
                TextColumn::make('time')
                    ->sortable()
                    ->searchable()
                    ->dateTime('H:i'),
                ToggleColumn::make('is_available')
                    ->onColor('success')
                    ->offColor('danger'),

            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),

            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    BulkAction::make('export')
                        ->icon('heroicon-o-document-arrow-down')
                        ->label('Export')
                        ->action(fn (Collection $record) => (new SlotTimeExport($record))->download('xyz.xlsx'))
                    // ->action(fn (Collection $records) => new (SlotTimesExports($records))->download())
                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //  RelationManagers\TimesRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSlotTimes::route('/'),
            'create' => Pages\CreateSlotTime::route('/create'),
            'edit' => Pages\EditSlotTime::route('/{record}/edit'),
        ];
    }
}
