package ex_main;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class QuartzTest {

	public static void main(String[] args) {

		try {
            // Grab the Scheduler instance from the Factory
            Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();

            // and start it off
            scheduler.start();
            
            // 스케쥴러가 처리할 작업
            JobDetail job = JobBuilder.newJob(HelloJob.class)
            		.withIdentity("job1", "group1")
            		.build();
            
            // 스케쥴러가 작업을 처리할 시점
            Trigger trigger = TriggerBuilder.newTrigger()
            		.withIdentity("trigger1", "group1")
            		.startNow()
            			.withSchedule(SimpleScheduleBuilder.simpleSchedule()
            					.withIntervalInSeconds(10)
            					.repeatForever())
            			.build();
            
            // 스케쥴러에게 작업과 처리 시점 알려주기
            scheduler.scheduleJob(job, trigger);
            
            // 일시 중지
            Thread.sleep(60000);
            
            scheduler.shutdown();

        } catch (SchedulerException se) {
            se.printStackTrace();
        } catch (Exception e) {
        	e.printStackTrace();
		}
		
	}

}
