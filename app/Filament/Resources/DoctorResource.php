<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DoctorResource\Pages;
use App\Filament\Resources\DoctorResource\RelationManagers;
use App\Models\Doctor;
use Filament\Actions\DeleteAction;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\BulkAction;
use Filament\Tables\Columns\TagsColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class DoctorResource extends Resource
{
    protected static ?string $model = Doctor::class;

    protected static ?string $navigationIcon = 'heroicon-o-briefcase';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('name')
                ->required()
                ->autofocus()
                // ->unique()
                ->placeholder("Enter your Name"),
                
                Textarea::make('specialization')
                ->required()
                ->autofocus()
                ->placeholder("Enter your Specialization"),

                TextInput::make('whatsapp_number')
                ->numeric()
                ->tel()
                ->required()
                ->unique(ignoreRecord: true)
                ->autofocus()
                ->placeholder("Enter your Number"),

                TextInput::make('fee')
                ->numeric()
                ->required()
                ->autofocus()
                ->placeholder("Enter your Fees quoted"),

                FileUpload::make('image')
                ->label('Upload Image')
                ->image(),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                ->sortable(),
                TextColumn::make('specialization')
                ->limit(30)
                ->wrap(),
                TextColumn::make('whatsapp_number'),
                TextColumn::make('fee'),
                TextColumn::make('slots_count')
                ->counts('slots')
                ->label('Days'),
                ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                // Tables\Actions\DeleteAction::make()
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    
                    
                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }
    
    public static function getRelations(): array
    {
        return [
            //
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDoctors::route('/'),
            'create' => Pages\CreateDoctor::route('/create'),
            'edit' => Pages\EditDoctor::route('/{record}/edit'),
        ];
    }    
}
