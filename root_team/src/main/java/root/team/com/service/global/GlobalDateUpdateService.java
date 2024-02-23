package root.team.com.service.global;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service("gDateUpdate")
@AllArgsConstructor
public class GlobalDateUpdateService implements GlobalService {
	
	public Date dateUpdate(Date date) {
		LocalDateTime localDateTime = date.toInstant()
		           .atZone(ZoneId.systemDefault())
		           .toLocalDateTime();
		LocalDateTime updatedLocalDateTime = localDateTime.minusHours(9);
		Instant instant = updatedLocalDateTime.atZone(ZoneId.systemDefault()).toInstant();
		return Date.from(instant);
	}

}
