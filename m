Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48D538E2F
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905F21125EA;
	Tue, 31 May 2022 10:00:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36F91125D9;
 Tue, 31 May 2022 10:00:24 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l19so7699302ejr.8;
 Tue, 31 May 2022 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SAtySkLvcNUXzz7ib9IziiicjVedfmYHvbHXwfWUJSo=;
 b=ezNoQAUxlApzRSlxG4JiS/YCWxGANQEMBMCQgATxnhP3gp3+ZMVr411g/URtHp2KFA
 f2ChR3RFwngrCVs7MCiQWoekB8YkFKK+caOAEKNtMtGAJPRZLUJ7j2c00h0X9TNtL0T+
 aHJui7m2EbzQadDD+FbLWipH1ktNgQpHm6lf1sj28ZZvD/1iiXkps8ipinLAy0O42RLY
 zTTegaIaDQYL53vJKk+O5RhcAs4qMBsDl6YHcQkYjXJTY1EOfzlpFLZZ/uwgiQXHKYDy
 rZAwphV2HGF7mwKPv8gVMLQ03jkfQzE4TopEkv5xWw0C5eXfVpfmNZ6CvesBT9o5ZvqD
 ltxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SAtySkLvcNUXzz7ib9IziiicjVedfmYHvbHXwfWUJSo=;
 b=zg8+Pm1GFbIL2vZXJB16o5KBFsS+ytcY0pzhNK/BTk/+Ko8gNvLhsTJOeFzMaSFaMs
 SBVcmF0evZnvAsUzgKAArXamyi3IFArZwFeZOwcGZQ8iZ79JVH+JC2wxAeqrovVppZQs
 DA/lSyYKUE/qSMR6+Ngpea89Zw30rGTaA2i/FmZoq1dr0ZmsbwTRk78r3pPB5cHg2mcL
 L7N9Y7+IJSjIkbMrR3jMy/teDGiklzgCtdt6sf6hnb/2I43WSjFDhDlfmwZyIb++1mxa
 q6eKG66wS3z482hVvOjoG8xAIWOhOtuzXumyH+uHzztPcb6hbrYl2hjFguyRFmcTiR9J
 xE9A==
X-Gm-Message-State: AOAM533HhUbFx3U1lQaWGb+Neo7qy8rfrFGza0ILbHOpIWpulsZri/Ig
 pr7gKcjy+FQYKbY5RZUGElr4Psa6hxnm2Q==
X-Google-Smtp-Source: ABdhPJxwBRRiOzRIc4wcP7bPQevp2uh1nTKIEri7IbT6+yRjL76vQVcRcKWHOXi4dB6U6w/w9RxFJg==
X-Received: by 2002:a17:906:974e:b0:6f5:2d44:7e3c with SMTP id
 o14-20020a170906974e00b006f52d447e3cmr51605009ejy.167.1653991223194; 
 Tue, 31 May 2022 03:00:23 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 12:00:03 +0200
Message-Id: <20220531100007.174649-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 09/13] drm/i915: use drm_oom_badness
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

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 3ffb617d75c9..f9676a5b8aeb 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1748,6 +1748,7 @@ static const struct file_operations i915_driver_fops = {
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = i915_drm_client_fdinfo,
 #endif
+	.oom_badness = drm_oom_badness,
 };
 
 static int
-- 
2.25.1

