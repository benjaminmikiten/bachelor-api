-- CreateEnum
CREATE TYPE "SeasonRole" AS ENUM ('PLAYER', 'LEAD', 'HOST');

-- CreateTable
CREATE TABLE "Player" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "dateOfBirth" TIMESTAMP(3) NOT NULL,
    "birthPlaceCity" TEXT NOT NULL,
    "birthPlaceState" TEXT NOT NULL,
    "height" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,

    CONSTRAINT "Player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Series" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "cancelled" BOOLEAN NOT NULL,

    CONSTRAINT "Series_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Season" (
    "id" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "firstAired" TIMESTAMP(3) NOT NULL,
    "lastAired" TIMESTAMP(3) NOT NULL,
    "seriesId" TEXT NOT NULL,

    CONSTRAINT "Season_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlayerSeasonRole" (
    "id" TEXT NOT NULL,
    "playerId" TEXT NOT NULL,
    "seasonId" TEXT NOT NULL,
    "role" "SeasonRole" NOT NULL,

    CONSTRAINT "PlayerSeasonRole_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Player_id_key" ON "Player"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Series_id_key" ON "Series"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Season_id_key" ON "Season"("id");

-- CreateIndex
CREATE UNIQUE INDEX "PlayerSeasonRole_id_key" ON "PlayerSeasonRole"("id");

-- AddForeignKey
ALTER TABLE "Season" ADD CONSTRAINT "Season_seriesId_fkey" FOREIGN KEY ("seriesId") REFERENCES "Series"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerSeasonRole" ADD CONSTRAINT "PlayerSeasonRole_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerSeasonRole" ADD CONSTRAINT "PlayerSeasonRole_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "Season"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
