Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8ECBACA0
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8888110EAA7;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gE7m1eTi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92E810E073
 for <nouveau@lists.freedesktop.org>; Tue, 30 Jul 2024 14:44:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U8v0fb029572;
 Tue, 30 Jul 2024 14:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l/pN3Orktibi2Gx1TE8d0CGoiC4jjvEU3fPqJwbBNB8=; b=gE7m1eTiqLRqrVMm
 u6uewvmNoudUNhSl7Lckvaa4rciwaYkuwoL7WsF+9+ch5/SDxLks2+9kwres0+s2
 qLEoJjfnASkjSsUd3f4FgPWjqC8Cv70k+2MfF5J06VORF2fveT0RCZ3xlGoDzgGP
 OXGWkI4tQ9zOIrbQ/aMunwsqHwDqrHx5AQ2pjGMDKacR5nXgqE8XwwHb9YGYbO31
 N4wdt4ayQKmFbUjtR1RfD5b0gwY5I2fb05c8eAPA7tuQv/+SzUCRN4ciq1iDTFI2
 US40tLyRytR4tXHWyTCZyLV2DFlQxMMLTBrGLmZMQxLEr4PZB0+gmNJsHCxgHH/x
 bYpmnQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw4411vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 14:43:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46UEhNvw031087
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 14:43:23 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 07:43:23 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 30 Jul 2024 07:43:21 -0700
Subject: [PATCH 4/5] fsi: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240730-module_description_orphans-v1-4-7094088076c8@quicinc.com>
References: <20240730-module_description_orphans-v1-0-7094088076c8@quicinc.com>
In-Reply-To: <20240730-module_description_orphans-v1-0-7094088076c8@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Russell King
 <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Karol Herbst <karolherbst@gmail.com>,
 "Pekka Paalanen" <ppaalanen@gmail.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Alistar Popple <alistair@popple.id.au>,
 Eddie James <eajames@linux.ibm.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-pm@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-fsi@lists.ozlabs.org>,
 <linux-aspeed@lists.ozlabs.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oE1-ugv7m5vwi_BkglOwMxdiOFX5wijr
X-Proofpoint-ORIG-GUID: oE1-ugv7m5vwi_BkglOwMxdiOFX5wijr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_12,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300100
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o

Add the missing invocations of the MODULE_DESCRIPTION() macro, and fix the
copy/paste of the module description comment in fsi-master-ast-cf.c.

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/fsi/fsi-core.c          | 1 +
 drivers/fsi/fsi-master-aspeed.c | 1 +
 drivers/fsi/fsi-master-ast-cf.c | 3 ++-
 drivers/fsi/fsi-master-gpio.c   | 1 +
 drivers/fsi/fsi-master-hub.c    | 1 +
 drivers/fsi/fsi-scom.c          | 1 +
 6 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 46ac5a8beab7..e2e1e9df6115 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1444,5 +1444,6 @@ static void fsi_exit(void)
 }
 module_exit(fsi_exit);
 module_param(discard_errors, int, 0664);
+MODULE_DESCRIPTION("FSI core driver");
 MODULE_LICENSE("GPL");
 MODULE_PARM_DESC(discard_errors, "Don't invoke error handling on bus accesses");
diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index b0b624c3717b..6f5e1bdf7e40 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -670,4 +670,5 @@ static struct platform_driver fsi_master_aspeed_driver = {
 };
 
 module_platform_driver(fsi_master_aspeed_driver);
+MODULE_DESCRIPTION("FSI master driver for AST2600");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
index f8c776ce1b56..a4c37ff8edd6 100644
--- a/drivers/fsi/fsi-master-ast-cf.c
+++ b/drivers/fsi/fsi-master-ast-cf.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2018 IBM Corp
 /*
- * A FSI master controller, using a simple GPIO bit-banging interface
+ * A FSI master based on Aspeed ColdFire coprocessor
  */
 
 #include <linux/crc4.h>
@@ -1438,5 +1438,6 @@ static struct platform_driver fsi_master_acf = {
 };
 
 module_platform_driver(fsi_master_acf);
+MODULE_DESCRIPTION("A FSI master based on Aspeed ColdFire coprocessor");
 MODULE_LICENSE("GPL");
 MODULE_FIRMWARE(FW_FILE_NAME);
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 10fc344b6b22..f761344f4873 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -892,4 +892,5 @@ static struct platform_driver fsi_master_gpio_driver = {
 };
 
 module_platform_driver(fsi_master_gpio_driver);
+MODULE_DESCRIPTION("A FSI master controller, using a simple GPIO bit-banging interface");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 6d8b6e8854e5..6568fed7db3c 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -295,4 +295,5 @@ static struct fsi_driver hub_master_driver = {
 };
 
 module_fsi_driver(hub_master_driver);
+MODULE_DESCRIPTION("FSI hub master driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 61dbda9dbe2b..411ddc018cd8 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -625,4 +625,5 @@ static void scom_exit(void)
 
 module_init(scom_init);
 module_exit(scom_exit);
+MODULE_DESCRIPTION("SCOM FSI Client device driver");
 MODULE_LICENSE("GPL");

-- 
2.42.0

