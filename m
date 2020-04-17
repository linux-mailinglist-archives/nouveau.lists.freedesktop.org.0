Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD31AE64C
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 21:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190426E99C;
	Fri, 17 Apr 2020 19:53:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCD66E99C
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587153185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i80sITLz+oOVttfOMtjBIkDo3ypFSAfdKikT8dtYqxA=;
 b=ImrvG5waxxV7M5SPdrqbGIK88Prm25iXukbASqFG4U0piFnKC5L/yKKhG10XMiEpmeqMZ2
 Wnhx6veQgRzPOe4VkZjVCr7u5LScbkI5iP8iDuJtZDJW7o73zZpp6yoz3ta5J6mFSdwgoS
 SnQ+PkonLUvkj8mV+Why+RNveMiBzIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-AwdWQmzXOUqk4s9ZpTlpBQ-1; Fri, 17 Apr 2020 15:53:03 -0400
X-MC-Unique: AwdWQmzXOUqk4s9ZpTlpBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7980E8018A5
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 19:53:02 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12DBE196AE;
 Fri, 17 Apr 2020 19:53:01 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 17 Apr 2020 15:52:56 -0400
Message-Id: <20200417195258.40054-4-lyude@redhat.com>
In-Reply-To: <20200417195258.40054-1-lyude@redhat.com>
References: <20200417195258.40054-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v2 3/5] lib/igt_debugfs: Add
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Like igt_debugfs_connector_dir(), but for pipes instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_debugfs.c | 29 +++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index bf6be552..3c3b11e1 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -260,6 +260,35 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
 	return ret;
 }
 
+/**
+ * igt_debugfs_pipe_dir:
+ * @device: fd of the device
+ * @pipe: index of pipe
+ * @mode: mode bits as used by open()
+ *
+ * This opens the debugfs directory corresponding to the pipe index on the
+ * device for use with igt_sysfs_get() and related functions.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_pipe_dir(int device, int pipe, int mode)
+{
+	char buf[128];
+	int dir, ret;
+
+	dir = igt_debugfs_dir(device);
+	if (dir < 0)
+		return dir;
+
+	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
+	ret = openat(dir, buf, mode);
+
+	close(dir);
+
+	return ret;
+}
+
 /**
  * igt_debugfs_open:
  * @filename: name of the debugfs node to open
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 7d1a6175..15741a40 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -36,6 +36,7 @@ char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
 int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
