
package acme.features.administrator.overture;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.overtures.Overture;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Administrator;
import acme.framework.services.AbstractCreateService;

@Service
public class AdministratorOvertureCreateService implements AbstractCreateService<Administrator, Overture> {

	@Autowired
	private AdministratorOvertureRepository repository;


	@Override
	public boolean authorise(final Request<Overture> request) {
		assert request != null;
		return true;
	}

	@Override
	public void bind(final Request<Overture> request, final Overture entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors, "creationDate");

	}

	@Override
	public void unbind(final Request<Overture> request, final Overture entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "creationDate", "deadline", "paragraph", "minimumMoney", "maximumMoney", "email");
	}

	@Override
	public Overture instantiate(final Request<Overture> request) {
		assert request != null;

		Overture result = new Overture();
		return result;
	}

	@Override
	public void validate(final Request<Overture> request, final Overture entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		Calendar calendar;
		Date minimumDeadline;

		//Deadline validation

		if (!errors.hasErrors("deadline")) {
			calendar = new GregorianCalendar();
			calendar.add(Calendar.DAY_OF_MONTH, 1);
			minimumDeadline = calendar.getTime();
			if (entity.getDeadline() == null) {
				errors.state(request, true, "deadline", "javax.validation.constraints.NotBlank.message");
			} else if (entity.getDeadline() != null) {
				errors.state(request, entity.getDeadline().after(minimumDeadline), "deadline", "acme.validation.deadline");
			}
		}

		//Money validation
		boolean money = entity.getMinimumMoney().getAmount() < entity.getMaximumMoney().getAmount() && entity.getMaximumMoney().getAmount() >= 0 && entity.getMaximumMoney().getAmount() >= 0;
		boolean currency = entity.getMinimumMoney().getCurrency() == "€" && entity.getMaximumMoney().getCurrency() == "€";
		if (!errors.hasErrors("minimumMoney") && !errors.hasErrors("maximumMoney")) {
			errors.state(request, money, "maximumMoney", "acme.validation.money");
		}

		if (!errors.hasErrors("minimumMoney") && !errors.hasErrors("maximumMoney")) {
			errors.state(request, currency, "maximumMoney", "acme.validation.money");
		}

	}

	@Override
	public void create(final Request<Overture> request, final Overture entity) {
		assert request != null;
		assert entity != null;

		Date creationDate = new Date(System.currentTimeMillis() - 1);
		entity.setCreationDate(creationDate);

		this.repository.save(entity);

	}

}
