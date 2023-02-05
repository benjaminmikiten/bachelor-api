import { Injectable } from '@nestjs/common';

import { PrismaService } from '../prisma/prisma.service';
import { Series, Prisma } from '@prisma/client';

@Injectable()
export class SeriesService {
  constructor(private prisma: PrismaService) {}

  create(data: Prisma.SeriesCreateInput): Promise<Series> {
    return this.prisma.series.create({ data });
  }

  delete(where: Prisma.SeriesWhereUniqueInput): Promise<Series> {
    return this.prisma.series.delete({ where });
  }

  findOne(where: Prisma.SeriesWhereUniqueInput): Promise<Series> {
    return this.prisma.series.findUnique({ where });
  }

  findAll(): Promise<Series[]> {
    return this.prisma.series.findMany();
  }

  update(
    where: Prisma.SeriesWhereUniqueInput,
    data: Prisma.SeriesUpdateInput,
  ): Promise<Series> {
    return this.prisma.series.update({ where, data });
  }
}
