import { Controller, Get, Post, Body } from '@nestjs/common';
import { UsersService } from './users.service';
import { User } from './entities/user.entity';

@Controller('users')
export class UsersController {
  constructor(private usersService: UsersService) {}

  @Get()
  async getAllUsers(): Promise<User[]> {
    return this.usersService.getAllUsers();
  }

  @Post()
  async createUser(
    @Body() body: { name: string; email: string },
  ): Promise<User> {
    return this.usersService.createUser(body.name, body.email);
  }
}
