
package acme.features.administrator.spamlist;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.spamlist.Spamlist;
import acme.entities.spamlist.Spamword;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface AdministratorSpamlistRepository extends AbstractRepository {

	@Query("select s from Spamlist s")
	Collection<Spamlist> findManyAll();

	@Query("select s from Spamlist s where s.id = ?1")
	Spamlist findOneById(int id);

	@Query("select s from Spamword s where s.spamlist.id = ?1")
	Collection<Spamword> findManySpamwordsById(int id);
}
