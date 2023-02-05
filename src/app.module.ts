import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma/prisma.service';

import { SeriesModule } from './series/series.module';

@Module({
  controllers: [AppController],
  providers: [AppService, PrismaService],
  imports: [SeriesModule],
})
export class AppModule {}
