import {
  Controller,
  Post,
  Delete,
  Get,
  Patch,
  Param,
  Body,
} from '@nestjs/common';
import { SeriesService } from './series.service';
import { Series as SeriesModel } from '@prisma/client';

@Controller('series')
export class SeriesController {
  constructor(private readonly seriesService: SeriesService) {}

  @Post()
  create(@Body() data: SeriesModel): Promise<SeriesModel> {
    return this.seriesService.create(data);
  }

  @Delete(':id')
  delete(@Param('id') id: string): Promise<SeriesModel> {
    return this.seriesService.delete({ id: String(id) });
  }

  @Get()
  findAll(): Promise<SeriesModel[]> {
    return this.seriesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<SeriesModel> {
    return this.seriesService.findOne({ id: String(id) });
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() data: SeriesModel,
  ): Promise<SeriesModel> {
    return this.seriesService.update({ id: String(id) }, data);
  }
}
