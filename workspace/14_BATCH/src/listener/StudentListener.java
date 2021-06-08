package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

@WebListener
public class StudentListener implements ServletContextListener {

	private SchedulerFactory factory;
	private Scheduler scheduler;
	
    public StudentListener() {
    	try {
			factory = new StdSchedulerFactory();
			scheduler = factory.getScheduler();
    		
		} catch (SchedulerException se) {
			se.printStackTrace();
		}
    	
    }

    public void contextDestroyed(ServletContextEvent sce)  {
    	try {
			scheduler.shutdown();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
    }

    public void contextInitialized(ServletContextEvent sce)  {
    	try {
    		JobDetail job = JobBuilder.newJob(StudentJob.class)
    				.withIdentity("job3", "group3")
    				.build();
    		
    		CronTrigger trigger = TriggerBuilder.newTrigger()
    				.withIdentity("trigger3", "group3")
    				.withSchedule(CronScheduleBuilder.cronSchedule("0 25 17 ? * TUE *"))
    				.build();
    		System.out.println("START SCHEDULER");
    		scheduler.start();
    		scheduler.scheduleJob(job, trigger);
    		
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
    }
	
}
