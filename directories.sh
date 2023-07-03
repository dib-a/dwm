#!/bin/bash

# Funktion zur Erstellung eines Ordners, wenn er noch nicht existiert
create_folder() {
    if [ ! -d "$1" ]; then  # Überprüfen, ob der Ordner nicht existiert
        mkdir -p "$1"  # Ordner erstellen (mit -p, um auch übergeordnete Ordner zu erstellen, falls erforderlich)
        echo "Ordner erstellt: $1"
    else
        echo "Ordner existiert bereits: $1"
    fi
}

# Funktion zur Erstellung der Unterverzeichnisse
create_subfolders() {
    parent_dir=$1  # Übergeordnetes Verzeichnis als erster Parameter übergeben
    shift  # Verschieben der Parameter, um den Rest als Unterverzeichnisnamen zu erfassen
    
    # Schleife über die restlichen Parameter (Unterverzeichnisnamen)
    for subdir in "$@"; do
        subdir_path="$parent_dir/$subdir"  # Pfad zum Unterverzeichnis erstellen
        subdir_path_lc=$(echo "$subdir_path" | tr '[:upper:]' '[:lower:]')  # Konvertierung des Pfads in Kleinbuchstaben
        create_folder "$subdir_path_lc"  # Aufruf der Funktion zum Erstellen des Unterverzeichnisses
    done
}

# Benutzername des aktuellen Benutzers
username=$USER

# Home-Verzeichnis
home_dir="/home/$username"

# Documents
documents_dir="$home_dir/documents"
create_folder "$documents_dir"

# Unterverzeichnisse für Dokumente
create_subfolders "$documents_dir" "work" "personal" "school" "archive" "shared" "templates" "persons" 

# Media
media_dir="$home_dir/media"
create_folder "$media_dir"

# Unterverzeichnisse für Media
create_subfolders "$media_dir" "images" "videos" "nasheed" "archive" "shared" "wallpapers" "screenshots" "podcasts" "audiobooks" "quran"

create_folder "$home_dir/configs"
create_folder "$home_dir/backup"
create_folder "$home_dir/downloads"
