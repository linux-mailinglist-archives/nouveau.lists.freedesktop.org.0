Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6261124558B
	for <lists+nouveau@lfdr.de>; Sun, 16 Aug 2020 05:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451876E02D;
	Sun, 16 Aug 2020 03:23:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DBA6E02D
 for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2020 03:23:40 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h21so9958459qtp.11
 for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2020 20:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhl0e7dwxzONc0qz8LYXsJx0Ud5msqyolgIT6sUDoGM=;
 b=q8U7M1x/hQ1qGcCtZpoRJFjfw8lYiCYnFb67MbwhFnnOv/G0AiMpYaBhjCRAEeYgiz
 XWKjy59ir691PeR7ocLoE2+q++sHZKIWgAc7opPMPKCwsLuopqB/SJ2cnOILm+umJkgY
 ZWGI+BZ6V0FvZFnTJaoWlb4e31ycz9k2HWQ80cQ6KxP9r2EaOy/CpYIQBi27iC7rSR07
 L9pgN3O6JRp+X5yxF3FS008i7i0Ch7DBKrpYIxlTKbuimKF3QHUDvofrbFs9LqvyWs76
 0MZadRQr6NKQW13md2hJxmyhGDjVVi1iGbrfI3wjR8Mne0rV3jkkel/tA0+ObX6nHuGt
 m2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bhl0e7dwxzONc0qz8LYXsJx0Ud5msqyolgIT6sUDoGM=;
 b=pxLjcoBV6thYwFesaAla9elJaV/b6S52JeO9Od2FNV+IH8R0PHQgL1K3gAFWHPIyhF
 r5pQDcdykek5dNnQxm9evNy4hlCB4z/umAIMTQL17RJjhSK6R+KRuRHlacr5gxq4FA1F
 fuHwY3uy/XUqPlmqI0jRW4ZujMWi+eBkuyWzv8tz2O8za+OOoAC4Tt8TEm+CMktWkmIN
 Pbsqio3XGfCEi9boh0LQkWUaI9fRbX9lNFqORoYc9h/zjpQZwQgJ6NuryVANXNkqxBna
 7Hw5gx+I1V8nqkoKWQ7R3uyUZijHb5ocrlNF3179PhYgaSlB6beNfz1zPlaDfhN+JFcC
 1W0w==
X-Gm-Message-State: AOAM530kIfZd+T34pR1o8etrsZyXfqXZ2VC4LVRW6nuXD7IvZuCI6oLL
 vrBNWHZEnmkuVE7aGZ9M6v0amFvEjJDjLA==
X-Google-Smtp-Source: ABdhPJwKSTeVL6TXPVKwm2stLc5j+mPpBvY3blf01rY3c/YJScbBNrwrSUeVYE4LF/psWtc/PZ0h5Q==
X-Received: by 2002:ac8:704:: with SMTP id g4mr8243112qth.250.1597548219162;
 Sat, 15 Aug 2020 20:23:39 -0700 (PDT)
Received: from athos.hellosponsor.com ([70.19.70.200])
 by smtp.gmail.com with ESMTPSA id 205sm12975136qkj.19.2020.08.15.20.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 20:23:38 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org
Date: Sat, 15 Aug 2020 23:23:35 -0400
Message-Id: <20200816032336.18964-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 1/2] drmmode: make event handler leave a note that
 there are stuck events
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We don't really expect to have too many events in the queue. If there
are, then the algorithm we use isn't appropriate. Add a warning when the
queue gets very long, as it's an indication of something having gone
wrong.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/drmmode_display.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 2d3229c..45292c4 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -159,6 +159,8 @@ drmmode_events = {
 	.prev = &drmmode_events,
 };
 
+static bool warned = false;
+
 static void
 drmmode_event_handler(int fd, unsigned int frame, unsigned int tv_sec,
 		      unsigned int tv_usec, void *event_data)
@@ -166,7 +168,10 @@ drmmode_event_handler(int fd, unsigned int frame, unsigned int tv_sec,
 	const uint64_t ust = (uint64_t)tv_sec * 1000000 + tv_usec;
 	struct drmmode_event *e = event_data;
 
+	int counter = 0;
+
 	xorg_list_for_each_entry(e, &drmmode_events, head) {
+		counter++;
 		if (e == event_data) {
 			xorg_list_del(&e->head);
 			e->func((void *)(e + 1), e->name, ust, frame);
@@ -174,6 +179,12 @@ drmmode_event_handler(int fd, unsigned int frame, unsigned int tv_sec,
 			break;
 		}
 	}
+
+	if (counter > 100 && !warned) {
+		xf86DrvMsg(0, X_WARNING,
+			   "Event handler iterated %d times\n", counter);
+		warned = true;
+	}
 }
 
 void
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
