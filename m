Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F727F091
	for <lists+nouveau@lfdr.de>; Wed, 30 Sep 2020 19:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A44E6E80B;
	Wed, 30 Sep 2020 17:32:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98A36E804
 for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2020 17:32:05 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601487124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9CzA/MH9595AD/2ACdm207/gYYjade7gzHRLAXYlV4=;
 b=diDpKHk7+frrWL/QmagYt77HKLsMtRmunNnMYINlrKU5Fn7I/zUtp1Kb4nFHiFSrr8i9HM
 V1CdZ4rGyfFjek3ROpErkXrU+8wNRIxJLc7Z2hyLH24aKlmrMD7UG2vrmmD5meRr7f9fwm
 MF0gAsex9jRI9QY5ydSFuc2T13/RMKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-545oqoxBMfSbbucAvrrGig-1; Wed, 30 Sep 2020 13:31:57 -0400
X-MC-Unique: 545oqoxBMfSbbucAvrrGig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9141005E67;
 Wed, 30 Sep 2020 17:31:56 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-118-194.rdu2.redhat.com [10.10.118.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F25978806;
 Wed, 30 Sep 2020 17:31:56 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Sep 2020 13:31:48 -0400
Message-Id: <20200930173150.431995-4-lyude@redhat.com>
In-Reply-To: <20200930173150.431995-1-lyude@redhat.com>
References: <20200930173150.431995-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v5 3/5] lib/igt_debugfs: Add
 igt_debugfs_pipe_dir()
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Like igt_debugfs_connector_dir(), but for pipes instead.

Changes since v4:
* Make igt_debugfs_pipe_dir() much smaller - jcline
* Fixup docs - jcline

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_debugfs.c | 21 +++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 05067078..c4dab392 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -260,6 +260,27 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
 	return ret;
 }
 
+/**
+ * igt_debugfs_pipe_dir:
+ * @device: fd of the device
+ * @pipe: index of pipe
+ * @mode: mode bits as used by open()
+ *
+ * This opens the debugfs directory corresponding to the pipe index on the
+ * device for use with igt_sysfs_get() and related functions. This is just
+ * syntax sugar for igt_debugfs_open().
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_pipe_dir(int device, int pipe, int mode)
+{
+	char buf[128];
+
+	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
+	return igt_debugfs_open(device, buf, mode);
+}
+
 /**
  * igt_debugfs_open:
  * @filename: name of the debugfs node to open
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 722c5cc3..d43ba6c6 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -36,6 +36,7 @@ char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
 int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
