Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4156CBAF0A
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD12410EC20;
	Sat, 13 Dec 2025 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=suse.com header.i=@suse.com header.b="aLG738LN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC7F10EAF4
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 10:20:29 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-429be5d31c9so543597f8f.1
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 03:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761906028; x=1762510828; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K3B/i06NPGDlGfPSmm0JeDJD/jaUMsY04sT9K+okWQQ=;
 b=aLG738LNBOEb14M4qfpL1t7uWL8k3GMrIVFjsVyNNxIHgoFQcw4J/fUK7r8xxojK/C
 fP2eE0FND9mXjxEh6e1gNskBVbOGeveOdUwoqokZvHq0uqwbIEaFjTjNwAB2LHzEUh9P
 4j8BsAt9ycBgq0ALUduseiFh1LPI34pJXJAXRibqjdgy01yOqi8Y4a2p6lvxdu4MC9L/
 ILXlEif6b9JLcF07mmIQsnC64s4vN4youHza2iRXcPqQ3kxuQLb1jbhXipa7enC51ina
 XIRs/ukWdmKHe1IV4+SMqYE+5Dz7o3+Tc4T8RLD9hWufVzbysMUWL9bhB4jQyOsfYhH9
 cF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906028; x=1762510828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K3B/i06NPGDlGfPSmm0JeDJD/jaUMsY04sT9K+okWQQ=;
 b=vC9kTZaWnV7uef1HOUuS537wAUY1AKhgJQWkqzQk8iPAF7Vd2n+yfYuW3H00TnRYcY
 MaCPxO1/JgHk+VxyDJredhpwacMdJGdKyibBWx6js1Ret4OAcjcBuhXEdVeCviZxqnqe
 ClxFKaKO1Iy6HHTGLdBX8AYK7j6g++rLM4C4wwfTukSVynTKtdiOfzc3eWXDEmqqmNns
 jPph5akDKehWv6K7c7Uv0N8vqXUsWx9dm5j1kMhHArLOuQt0PqMSejJA9yWkBokKx4Iq
 o3L0nffFHNaknrluQxE5p9+FNtvJxWfIovFNhKf2R/82S9hW96Ogmjsq0kHYIP+LwKTO
 AP/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8otv8x9mT/bq4wp/4bIFOvp+/+2VcxO3M+E2Rn+4y0RLA9EVRwVYrIeysocUfp4CxGWckwJIM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjvRUZqNOlEkSIM2MAI0Dnpq26wa7rqMNnr9OxZyzIfMW1CRiJ
 NkANOqCYW+mL2ceBdRGGDc5EWqNYigqK+Hznoh5DTLm173eEcNQuTGB2WLKtOvqN4FE=
X-Gm-Gg: ASbGncucOFiqYmUA1Bmk/fxO79THlOhwPT9pPWwHEFYEKZFePep8jWGR7u55kfqt2Yc
 Sx2pfy0m65DALzExOx9/5Mq8xFoMSZNa1dKcOhKIjv8nnCLAKPveWdJ+7SayUhYJ7AJ2JhtXBbf
 YsCyqPrk9xH5WhU48umo4AHvaWRdVGL/ozfdEyaattwONTlrrXjmnsl1fF3bg9YEvO5H1OrGW2e
 iePVdDyjU1QH+PjIAol4oZgTmHX5oCs4LGkWtGIBv2G/fTU00ZCrQPISlstXrPWhf6jGV8o37UC
 r7SHRWxMI7msvlMoH4jepDjMT26Cuy735qOjjQ/qsMSHG/gTvLKdLjZWvjUeQ2PmKvUsCk+xzMD
 HIZ2aS0Ocz2IFsym7I1tieuyKBWg8uYtmHw5crZsNctQMRNfLgJGsk9H4I7EgaZoxcRDQwrPUl/
 dWiP77bb///5fqTdWZ6DRvyvCQ5GMTXmXfvXAU59cn9KMNaA==
X-Google-Smtp-Source: AGHT+IGfCTVgpG9l9puSWTYiK3G0d8gKcngL5r4WJ3Xi2AmzTOfMv+bHNEWDuIFmlbATDHcuNOQgMg==
X-Received: by 2002:a05:6000:2892:b0:428:55c3:cea8 with SMTP id
 ffacd0b85a97d-429bd6e16bemr2293210f8f.50.1761906027732; 
 Fri, 31 Oct 2025 03:20:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110037asm3090410f8f.3.2025.10.31.03.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:20:27 -0700 (PDT)
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
Subject: [PATCH 0/2] replaced old wq name, added WQ_PERCPU to alloc_workqueue
Date: Fri, 31 Oct 2025 11:20:18 +0100
Message-ID: <20251031102020.95349-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
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

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1]  Replace uses of system_unbound_wq

    system_unbound_wq is to be used when locality is not required.

    Because of that, system_unbound_wq has been replaced with
	system_dfl_wq, to make it clear it should be used if locality
	is not important.

2) [P 2] WQ_PERCPU added to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.


Thanks!


Marco Crivellari (2):
  drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
  drm/nouveau: WQ_PERCPU added to alloc_workqueue users

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.51.0

