Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63261538E21
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05E71125CB;
	Tue, 31 May 2022 10:00:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09ACE1120D9;
 Tue, 31 May 2022 10:00:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w27so10102988edl.7;
 Tue, 31 May 2022 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SljQJAeVhGKeIBI51MbYTdJihy0sRNkihcgcWrQIyMk=;
 b=ZBp9EWdv4dyFa/WsIYerVBV/5Czl1dSOQzB0bWaLR8VuemQ6QOm1M4R69eKpHA9nd6
 c1HPF6oYuRRxZPShB/rzFxpDYr2SzpVcfmaTTI1/AsPIJMT2sPHv14VCM3Ka5VBHYXAs
 x+RhdpJZ93axyquUdQTI8BbhfGTHEGOHs1mum12ZFtPHB/T1dEkf20VpzDu5c8o8JJxt
 L5805s8can7oaGbMP04m/NeJEPnJ5J3kmnPoXDsme1EeBIo1b0t4i/Kl8NIO/OOcqJec
 9FKHHAZGXXE+S9p7n7ifDG4TYZso+CBFSqXccDBgxGoDfbZX1IAhrrimZdFs69Jaqd2K
 a48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SljQJAeVhGKeIBI51MbYTdJihy0sRNkihcgcWrQIyMk=;
 b=HiYzugW02zuHHgbI4M1tKjSR3nnaryb0K76Lixs4Bf+FeNaE48ATRaRCe/I5vinwoq
 aRv26So1qG4HxxdXBFXyRXlFytFaTUoGhU5RZvHz7fvbLqCczYMm1UR2hpsdxNBv0Bu8
 5BZXSOraH45TTKhQYmUaeNXbypLIRplTPjgla7k30nxT5ydG+PE0wbMCqIymKoZ/+DXR
 9wvcHpdu763542OM4Bnh/1RTES21YxryYDQzaHFyFGT3/Ro1IZR0abm+S6tdF1GGhQdB
 qAt497z/YDHk736+LYdXyp+MOxKTNoZtSI/g76JVl4U79AXjP+zBxGgb2k2GVNa9v3yw
 Qylg==
X-Gm-Message-State: AOAM531Z9g0ovuFh3WRcT82DT1Wj9hh9yBc4Faevl2RPIkpFi6xrblDd
 VzJrW+o3G5sJSqNe0MIsRdU=
X-Google-Smtp-Source: ABdhPJyZPq+OysWRAlAZamevHlLGk4fQamGD+X1EEEY6OJezkY6NR4XeOrBHuCnsv4+0HlBYkj/10Q==
X-Received: by 2002:a05:6402:34d4:b0:42b:35e5:fc78 with SMTP id
 w20-20020a05640234d400b0042b35e5fc78mr53286582edc.372.1653991213421; 
 Tue, 31 May 2022 03:00:13 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 11:59:56 +0200
Message-Id: <20220531100007.174649-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 02/13] oom: take per file badness into account
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
Cc: andrey.grodzovsky@amd.com, hughd@google.com, viro@zeniv.linux.org.uk,
 daniel@ffwll.ch, alexander.deucher@amd.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Try to make better decisions which process to kill based on
per file OOM badness. For this the per file oom badness is queried from
every file which supports that and divided by the number of references to
that file structure.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 mm/oom_kill.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 49d7df39b02d..8a4d05e9568b 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -52,6 +52,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/oom.h>
 
+#include <linux/fdtable.h>
+
 int sysctl_panic_on_oom;
 int sysctl_oom_kill_allocating_task;
 int sysctl_oom_dump_tasks = 1;
@@ -189,6 +191,19 @@ static bool should_dump_unreclaim_slab(void)
 	return (global_node_page_state_pages(NR_SLAB_UNRECLAIMABLE_B) > nr_lru);
 }
 
+/* Sumup how much resources are bound by files opened. */
+static int oom_file_badness(const void *points, struct file *file, unsigned n)
+{
+	long badness;
+
+	if (!file->f_op->oom_badness)
+		return 0;
+
+	badness = file->f_op->oom_badness(file);
+	*((long *)points) += DIV_ROUND_UP(badness, file_count(file));
+	return 0;
+}
+
 /**
  * oom_badness - heuristic function to determine which candidate task to kill
  * @p: task struct of which task we should calculate
@@ -229,6 +244,12 @@ long oom_badness(struct task_struct *p, unsigned long totalpages)
 	 */
 	points = get_mm_rss(p->mm) + get_mm_counter(p->mm, MM_SWAPENTS) +
 		mm_pgtables_bytes(p->mm) / PAGE_SIZE;
+
+	/*
+	 * Add how much memory a task uses in opened files, e.g. device drivers.
+	 */
+	iterate_fd(p->files, 0, oom_file_badness, &points);
+
 	task_unlock(p);
 
 	/* Normalize to oom_score_adj units */
-- 
2.25.1

