import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Owner } from '../../model/truck/owner.entity';
import { OwnerRepository } from '../repository/owner.repository';

import { Like, SelectQueryBuilder } from 'typeorm';
import { OwnerDTO } from '../../dto/truck/owner.dto';
import { GenericCrudService } from 'src/core/generic-crud-service';
import { PageableService } from 'src/core/pageable-service';
import { Pageable } from 'src/core/domain/pageable';
import { PaginatedPage } from 'src/core/domain/paginatedPage';

@Injectable()
export class OwnerService extends GenericCrudService<Owner, OwnerDTO>
  implements PageableService<OwnerDTO> {
  constructor(@InjectRepository(Owner) repository: OwnerRepository) {
    super(repository);
  }

  findOwnersByCUIL(cuil: string): Promise<OwnerDTO[]> {
    return this.repository
      .find({
        where: {
          cuil: Like('%' + cuil + '%'),
        },
        take: 10,
        skip: 0,
      })
      .then(result => result.map(owner => this.mapToDTO(owner)));
  }

  mapToDTO(entity: Owner): OwnerDTO {
    return new OwnerDTO(entity);
  }

  mapToEntity(dto: OwnerDTO): Owner {
    return new OwnerDTO(dto).mapToEntity();
  }

  getPage(pageable: Pageable): Promise<PaginatedPage<OwnerDTO>> {
    const page: PaginatedPage<OwnerDTO> = new PaginatedPage<OwnerDTO>();
    const query: SelectQueryBuilder<Owner> = this.repository.createQueryBuilder(
      'owner',
    );
    query.select('owner');

    if (pageable.hasFilters()) {
      if (pageable.filters.get('firstName'))
        query.where('owner.firstName like :firstName', {
          firstName: '%' + pageable.filters.get('firstName') + '%',
        });
      
      if (pageable.filters.get('lastName'))
        query.where('owner.lastName like :lastName', {
          lastName: '%' + pageable.filters.get('lastName') + '%',
        });

      if (pageable.filters.get('email'))
        query.andWhere('owner.email like :email', {
          email: '%' + pageable.filters.get('email') + '%',
        });

      if (pageable.filters.get('cuil'))
        query.andWhere('owner.cuil like :cuil', {
          cuil: '%' + pageable.filters.get('cuil') + '%',
        });
    }
    query.skip(pageable.page * pageable.size);
    query.take(pageable.size);
    return query
      .getMany()
      .then(owners => {
        page.data = owners.map(t => this.mapToDTO(t));
        return query.getCount();
      })
      .then(count => {
        page.total = count;
        page.page = pageable.page;
        return page;
      });
  }
}
