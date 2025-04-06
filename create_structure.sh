#!/bin/bash

# Main folders
mkdir -p lib/features/auth/{data/{models,repositories,datasources},domain/{entities,repositories,usecases},presentation/{viewmodels,views}}
mkdir -p lib/features/home/presentation/{viewmodels,views}
mkdir -p lib/core/{network,providers}

# Files
touch lib/main.dart

# Auth - Data
touch lib/features/auth/data/models/user_model.dart
touch lib/features/auth/data/repositories/auth_repository.dart
touch lib/features/auth/data/datasources/auth_remote_datasource.dart

# Auth - Domain
touch lib/features/auth/domain/entities/user.dart
touch lib/features/auth/domain/repositories/auth_repository.dart
touch lib/features/auth/domain/usecases/login.dart
touch lib/features/auth/domain/usecases/register.dart

# Auth - Presentation
touch lib/features/auth/presentation/viewmodels/auth_viewmodel.dart
touch lib/features/auth/presentation/views/login_page.dart
touch lib/features/auth/presentation/views/register_page.dart

# Home - Presentation
touch lib/features/home/presentation/viewmodels/home_viewmodel.dart
touch lib/features/home/presentation/views/home_page.dart

# Core
touch lib/core/network/api_client.dart
touch lib/core/providers/providers.dart

echo "✅ Flutter DDD folder structure created successfully!"
