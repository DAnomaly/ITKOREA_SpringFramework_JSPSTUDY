package ex_listener;

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

//@WebListener // 나는 리스너이다.
public class MyListener implements ServletContextListener {

	private SchedulerFactory factory;
	private Scheduler scheduler;
	
    public MyListener() {
    	try {
    		// 스케쥴러 만들기
    		factory = new StdSchedulerFactory();
    		scheduler = factory.getScheduler();
		} catch (SchedulerException se) {
			se.printStackTrace();
		}
    }

    public void contextDestroyed(ServletContextEvent sce)  {
    	// 웹 서비스가 종료될 때 (톰캣에서 프로젝트가 제거될 때)
    	System.out.println("리스너가 종료되었습니다.");
    	
		try {
			// 스케쥴러 종료
			scheduler.shutdown();
		} catch (SchedulerException se) {
			se.printStackTrace();
		}
    }

    public void contextInitialized(ServletContextEvent sce)  {
    	// 웹 서비스가 시작되었을 때(톰캣에 프로젝트가 올라갈 때)
    	System.out.println("===== WebService Start! =====");
    	try {
    		// Job (스케쥴러가 할 일)
    		JobDetail job = JobBuilder.newJob(MyJob.class)
    				.withIdentity("myJob", "group2")
    				.build();
    		
    		// Trigger (일하는 시간)
    		// -> CronTrigger를 가장 많이 사용
    		CronTrigger trigger = TriggerBuilder.newTrigger()
    				.withIdentity("myTrigger", "group2")
    				.withSchedule(CronScheduleBuilder.cronSchedule("0 0/1 * 1/1 * ? *")) // cronSchedule()에 전달한 인수는 cron식(cronMaker에서 생성)
    				.build();
    		
    		// 스케쥴러 시작
    		scheduler.start();
    		
    		scheduler.scheduleJob(job, trigger);
    		
		} catch (SchedulerException se) {
			se.printStackTrace();
		}
    }
	
}
