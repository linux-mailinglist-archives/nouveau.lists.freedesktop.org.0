Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EFCCBAED4
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1883710EC4A;
	Sat, 13 Dec 2025 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=suse.com header.i=@suse.com header.b="KYVPYC5T";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF6110EAF6
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 10:20:30 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso14616645e9.3
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761906029; x=1762510829; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lG/JWTB4mQFHfKHxkHY65ceoWtJs048pwnbqojq+RhA=;
 b=KYVPYC5T6Tk7oCK/+OhvuGEBwmuub+qWgQpFvpC5H10JeB18vaVAPbbLt67hZnMvDv
 otDw52FJszZzqLw9XsEgy7CfIFEIhGazfNzfXOn88k4DiO9uxfiiZNiyx5JStENDv/PN
 TWyzPve2/2QKfhtcxHyjrgJkQ/YlVtwVl3dLSb23PphkDxTZeDTDPvuu+6cPBfIgVPRE
 te38dwgo3bMWhs4QED1I0M8tcFLEG7vfPm0KUoth3W4rzrTDbN3Ygc1IoKHequbeM9Al
 RAiI9oJc7c98t0woIz4DXVn5Y+LUgOWIgSvCsdmf3QGtoBqc6rOfh3VE2B/pVy+rBDXP
 1eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906029; x=1762510829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lG/JWTB4mQFHfKHxkHY65ceoWtJs048pwnbqojq+RhA=;
 b=wr/X4LAv7unAryFLjP35nKOMEohG5zK9sXSRp1rNI47qg+0XbQ+9fzQ5ZpiemB4e5N
 Dy3nbtB3zb228KidyYbfHOetmw47VWhU0ohD4KutAz39yCW1IkSeLCK1mblsw5uJAcbD
 +YHgHqAvOGVNxgEo9C/7xgUyrc+Q/TjBItkC+TjBHME+oWA0Y73ruYNZCrqmCdGKqlNS
 qRjkS6nBNeGC9nYgUvbAKCUzCj3DyjSWR3e+k6fAS0EdVERXgHeMtp+gZlsbj2B+Er9N
 BZqzz7/QlvUuv0LvTfKOy8C8wHBFrYf4nFT6DZfWd+jKkUyNYo1I5CtDeYt1k9cWx9pi
 s4mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVPcdOAsXoFmNzi7k6MUxMJL22mOwre5I+Da0Q0JBC5ls4+tyAL2mINBZvJ2Vp6I1mvdun0LHU@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya8YWhb30h9B/28uC/bza/FywZCt3IaiKMzfyKQuMrbTTEgH/z
 /MoySYOK7OwSVgMs2XSfgjMTDm5ocY/HraP2d42HHZyo81YyLdPkXMftJ3BedFOnVwg=
X-Gm-Gg: ASbGnctvVoCTtHctILIN2jP68yWeyXryl+R1bNIbFgxx2tTVdzs81cQF9kl+V+mW51R
 N+gG31znZ/Cl3m9H/s59TWaCCvau8tkD0l9DG4eaVh8UES3rzgGJlSSyXwR9l6QFmwHV3S5BbX5
 5K6DJKCLk/dAJcypH6+/4eG0LK9upsPgHpr3+NPu/blQ/U6ui4awMFxITRQH7DV7Pg4ZrJ7eOQB
 NGwhdTmSM7hd8+zyvnyDPvQjLFOmN0pv+59+JuDrXqOfYdHbvUo/NPXXze808OoHoVc95uPfZVy
 hkN+2o2wJCShJutjIP/15OCjXwKJBmulCR4SUB4stu5rwk38Hzrpuu1zoehB0ph0hXuc41XNwME
 So+pjXRZxgL0nwi/eVXeWN/56HP5PzIPd6+v6+hnqgvEKMA1oS/SvJToIV79Nd3bucqChJb2W1y
 kYFJ7D+4PMQD7ZfABj3ZVlBq8ZAPxdWQGN3/w=
X-Google-Smtp-Source: AGHT+IFxPuEPZ18LFLMwyhb4w1UgiiQJF5IBQ0ySKwVqt0uLPj62F1MUEQhY67w2SzSkdspzyNNBCw==
X-Received: by 2002:a05:6000:2511:b0:429:b7bb:89bc with SMTP id
 ffacd0b85a97d-429bd672238mr2018518f8f.1.1761906028685; 
 Fri, 31 Oct 2025 03:20:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110037asm3090410f8f.3.2025.10.31.03.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:20:28 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/nouveau: replace use of system_unbound_wq with
 system_dfl_wq
Date: Fri, 31 Oct 2025 11:20:19 +0100
Message-ID: <20251031102020.95349-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
References: <20251031102020.95349-1-marco.crivellari@suse.com>
MIME-Version: 1.0
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

This lack of consistency cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e97e39abf3a2..50b7aade5f0a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2474,7 +2474,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 	pm_runtime_get_noresume(dev->dev);
 
 	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
+		queue_work(system_dfl_wq, &state->commit_work);
 	else
 		nv50_disp_atomic_commit_tail(state);
 
-- 
2.51.0

