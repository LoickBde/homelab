import { Inject, Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';
import { User } from './entities/user.entity';

@Injectable()
export class UsersService {
  constructor(@Inject('DATA_SOURCE') private dataSource: DataSource) {}

  async getAllUsers(): Promise<User[]> {
    const userRepository = this.dataSource.getRepository(User);
    return userRepository.find();
  }

  async createUser(name: string, email: string): Promise<User> {
    const userRepository = this.dataSource.getRepository(User);
    const user = userRepository.create({ name, email });
    return userRepository.save(user);
  }
}
