Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5821DCBAE9D
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC2910EC1C;
	Sat, 13 Dec 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=suse.com header.i=@suse.com header.b="Zhbcz02f";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC0E10EAF8
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 10:20:31 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso1555374f8f.0
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761906030; x=1762510830; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/u+awZrbSzQ6eDfqV7nDtHfvXhS1UpzbuBjH1UCPs0c=;
 b=Zhbcz02fqu1/BP1Jl6q7KkM5oCidczad0aFj3YvNmRT3UkLJHW6iByh8CAwP8kbr4v
 LmB/FAXTMusf5w2Hbud2K/zMLiN7S3Yx7sHRjZ6B1S4bvu603h726Fh2Uph7gblV6agL
 bWWDJS647L8v6GwUHO1POusHuvdEV9sZd5MJ0175kMmb5WxUEjS2VnQh2mqvPzMkSQaf
 yt5USNLTFn9mycQbeEmBliA8fKriOYfJbGvk63FF/CG06CaEWAuy/7GxD6HB2jKCFQxY
 pwum4ptrdfiCEu4DZ6AjbGU8Bxclbkzhhn3grspxhPZC2uBZR2f8VGweUv2gBUOEfc+T
 sbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906030; x=1762510830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/u+awZrbSzQ6eDfqV7nDtHfvXhS1UpzbuBjH1UCPs0c=;
 b=nGlXHf6jgenoZVYugMwqqiwQPJtSSCFZPxK1hFaC3XTZcm/LnRZ2rr17rDgSWbGJBB
 ho7m+s7EyG5PTR7BmY7xPAMUvHh5SZ7iyQTeqDISdQOVgjnHqJWaY1Kft0JVxRF4008L
 Fv1WmDBu7i9OU89w6ISqPJLIR/w2HdAthv/JS6nZqKiskFS1xCN9NJUNi71rZQxG5Sc4
 sqrmQ0wg8PZB/80fQQecQ0tGOjor7icDgSk1/ZN7FcALQwqCylU0qz1LlhcMsNOHAesS
 yR3iXZFPVgi6zYWoy7c36s0tk+OsiipdsTA0b5sHh9/KnriyyWCrJSdBDeb8VBiK6JOR
 14sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRTvPFA91dmLluf73vaJ3ZnBJAmartxaZ/WwMgGfiM4JiNjqD9HAVYxOYgGHhjo3OVX0SgeBj5@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9flX21tJ8IuQZG4mBfVaOAfHVQC5BtgzGIS8vHGeCpZyoklib
 dtyUp+003mjSKa58kHRmxr6Q0sTJo9Ekib02rl5u2MTHIfsJFU8DBVvGkoCIKGJGRUE=
X-Gm-Gg: ASbGncuBBb8IeAX32mJhBDDzKbQxuG/3lzy9K7AoucWcKS82KLgnYxf0GgPbsRwmVIp
 h+Wa7NXDjwWABSnWHMrTvEPRACW3YbhMD8brwYjIkvp2/hZIhkjvGaMjWS+BvyS55C2e3A7jq1k
 5ibOhPh07YVDa7bZ8x2zGSD5X5KN7+03PqnTZ8VWOjwocdQer70Oxe3VXC41wu5TC0ry8cOok7O
 Q14a0fqRt3qLFMT38C4rIZuk6OacTTwsOAZymzWxC8nmqO0Ns1Y+fr+Z80wsVpwUW3OjmQOySPY
 +WEz25SxQ5Eqlyxighu3o02H81SndJCqUrHx53FlDaXwNtD/gwqCRkIFWvPj/oI5yhTCO0HV20z
 T7wfnMITGz0ttLM72kNxZJS6EaZVjlc9NpywBZs7otQhGesCWY3+AreeyhuOAZmxDRdOJiOfaXV
 puW0+Bi7/QPobTLwswxCYAunZgCfuXuJFVt1VRDPY+5XeEWg==
X-Google-Smtp-Source: AGHT+IFGDvTKB2rxlJh5yej09wy7WNNlEMpaWtu5SfSjAIP63L2LKeKXvN3qht8svwvhZJc5Fdl6Ag==
X-Received: by 2002:a05:6000:2f86:b0:3f0:2ab8:710f with SMTP id
 ffacd0b85a97d-429bd671cc6mr2113941f8f.8.1761906029644; 
 Fri, 31 Oct 2025 03:20:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110037asm3090410f8f.3.2025.10.31.03.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:20:29 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/2] drm/nouveau: WQ_PERCPU added to alloc_workqueue users
Date: Fri, 31 Oct 2025 11:20:20 +0100
Message-ID: <20251031102020.95349-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
References: <20251031102020.95349-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:49 +0000
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..5a2970ef27d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -631,7 +631,7 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	struct drm_device *dev = drm->dev;
 	int ret;
 
-	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
+	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", WQ_PERCPU,
 					WQ_MAX_ACTIVE);
 	if (!drm->sched_wq)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index e60f7892f5ce..79cf157ab2a5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -416,7 +416,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	int ret;
 
 	if (!wq) {
-		wq = alloc_workqueue("nouveau_sched_wq_%d", 0, WQ_MAX_ACTIVE,
+		wq = alloc_workqueue("nouveau_sched_wq_%d", WQ_PERCPU,
+				     WQ_MAX_ACTIVE,
 				     current->pid);
 		if (!wq)
 			return -ENOMEM;
-- 
2.51.0

