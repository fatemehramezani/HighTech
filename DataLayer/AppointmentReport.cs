using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class AppointmentReport
    {
        public DoctorAppointmentView[] Select(DateTime Date, byte DoctorId)
        {
            DatabaseEntities databaseEntities = new DatabaseEntities();
            return databaseEntities.DoctorAppointmentViews.Where(appointment => appointment.Start == Date && appointment.DoctorId == DoctorId).ToArray();
        }
        public PatientAppointmentView[] Select(DateTime Date, int PatinetId)
        {
            DatabaseEntities databaseEntities = new DatabaseEntities();
            return databaseEntities.PatientAppointmentViews.Where(appointment => appointment.Start == Date && appointment.PatientId == PatinetId).ToArray();
        }
    }
}
