package ro.sd.a2.domain.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StudentClassBookDTO {

  private String studentId;

  private String classBookId;

  private int classBookYear;

  private int classBookSemester;

}
