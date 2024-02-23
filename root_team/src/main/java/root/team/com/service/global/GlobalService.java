package root.team.com.service.global;

import java.util.Date;

public interface GlobalService {

	default Date dateUpdate(Date date) {
		return null;
	}
}
