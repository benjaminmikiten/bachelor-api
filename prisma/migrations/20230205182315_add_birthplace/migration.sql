/*
  Warnings:

  - You are about to drop the column `birthPlaceCity` on the `Player` table. All the data in the column will be lost.
  - You are about to drop the column `birthPlaceState` on the `Player` table. All the data in the column will be lost.
  - Added the required column `birthplaceId` to the `Player` table without a default value. This is not possible if the table is not empty.
  - Added the required column `occupation` to the `Player` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Player" DROP COLUMN "birthPlaceCity",
DROP COLUMN "birthPlaceState",
ADD COLUMN     "birthplaceId" TEXT NOT NULL,
ADD COLUMN     "occupation" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Location" (
    "id" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Location_id_key" ON "Location"("id");

-- AddForeignKey
ALTER TABLE "Player" ADD CONSTRAINT "Player_birthplaceId_fkey" FOREIGN KEY ("birthplaceId") REFERENCES "Location"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
