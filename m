Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFF7AB790
	for <lists+nouveau@lfdr.de>; Fri, 22 Sep 2023 19:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB0710E6BE;
	Fri, 22 Sep 2023 17:32:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EA110E6B5
 for <nouveau@lists.freedesktop.org>; Fri, 22 Sep 2023 17:32:24 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c364fb8a4cso22829695ad.1
 for <nouveau@lists.freedesktop.org>; Fri, 22 Sep 2023 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695403943; x=1696008743;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+TspM6FqnyWCQqgdT3WqLoCMBUMYLUrvB7POKzIF40=;
 b=N99+lTXXBdw2FS6VqJFobDd7VwEw6H3StWC+hBm88qqivu08ytiF4GcQ0LaaFfUur2
 MhY3yDDPHCAbmhnWnTveH8w20AgKhgpx8JzM/xO6k2AxEwSoz1N501x+hjGc8cbTmSPT
 6FtYWxeNCgEAYu5ExjN3X/ucNVgIykRHR8MN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695403943; x=1696008743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+TspM6FqnyWCQqgdT3WqLoCMBUMYLUrvB7POKzIF40=;
 b=NxaFgDK2BuGyZGelglSpHC67Kx2loe+FStwek8+a70HXL5BAsZZzPKLWT/H6GHgd+l
 7veMAIUq8zXklnsYhcXhTbjsCONMH1j2DbiERALknMxiulNx+0KPV0CylHGhriOIYh5a
 jrHyxgEbbD9J6ewMMk/9m4zyxOdxJqV88vFeSc6PXTN5ChkDeCCysDV3GzQFggxnfgBw
 QXA9+v3iFd6hxT+D6u/x3EcP83LPHrUKYLJVHqYKNtj9u/BRDQOZUVKkgQmHXYYzfPHj
 sR69jYLc6eb+UZifpUQCj0s+kHUJT9iZ9MjClYNw3tkOaoPVDgjmYkbGYqcfSVHMVho5
 WUbQ==
X-Gm-Message-State: AOJu0YweTAYpW2MxkE+AXmx293bzL9+AYUT/UKHAC4EEuHNHTQM+vYYo
 SrOCYe+csnIobqdYqLxLMRiH1w==
X-Google-Smtp-Source: AGHT+IGM2cgwn42K1WN8W9Zq/dfNXRG8PNtjzN+GwImGnEoLu2Sgi5BNiv1fIm5lYau2SjWWAldPQg==
X-Received: by 2002:a17:90a:2a4a:b0:26d:2bac:a0bb with SMTP id
 d10-20020a17090a2a4a00b0026d2baca0bbmr347669pjg.6.1695403943655; 
 Fri, 22 Sep 2023 10:32:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 gq7-20020a17090b104700b0025bd4db25f0sm3547696pjb.53.2023.09.22.10.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:32:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Date: Fri, 22 Sep 2023 10:32:11 -0700
Message-Id: <20230922173216.3823169-6-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=keescook@chromium.org; 
 h=from:subject;
 bh=4ERTESaqnYz8ImDqyHPyzXy0AuquVom9vq+hq0gy89g=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+eg2zdwhFFl6K23RVdCG+VU9OV+t2/BviGN
 QnAc1heAtyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JvO0D/4+c0QkeKEEEd/HWEG0VvFv4kIlOeqfDMOPwJ1QkN1jVwlbiQVdn9lWjRgUq77jqzdpagc
 0e9qirU7jL0cbTe+JOBsFEQkZYwnIV0EUxV5Wb9g3csLF1vPRQafhR8984UzEKRtulAS9kQTSMT
 xYBkkYy+pbMJZNux38iCGgJFdWD057RPEazeM0Aatd5kaNk0HGNFRG/lz7HPcD9XIged7BCjFe4
 O5fJlM/WnYAAAK2cZn9AtONFzhR65gyQwb4pt0CXxC/kBS6pb6GBT8V9AsVWH8zu6CsMIVjafAT
 OdJEF/tJGI7jp48gN51zXgv1VAdOAJOLBc/kciYavjyryrGgXYANueMuiXx+r42kxUG0yZkO3/X
 uq+N33+UiId1hMftODv6WGPcCbwFJtgAfev1bfSRgKYiKQyjWPcbW5NPGeYVKKsvsew1qqGZWpN
 ASd96EwnB4kIHBeIp1k14aTdlgBVRePuuE2Vrf/gjb9uTNMh605/Yq2hNu83sG0S0fKskR2pH6r
 /VbQ9GYa6Dm3r4bYE6S0RRzMROjl3MXFBv4R99QF1UUF4V4iGgkcUUE3tdB+iCxIW1I5SuGR620
 4ajKmF3Z9xPkw56NlVdKBjnhCKGSlHNQv+Rh5xh0IeFJzR6f8SO8/u45ADDZHCkCqxoc7tiLP68
 zupfltyyH8r66bw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 6/9] drm/vc4: Annotate struct vc4_perfmon with
 __counted_by
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Prike Liang <Prike.Liang@amd.com>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Nathan Chancellor <nathan@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Chia-I Wu <olvaffe@gmail.com>,
 linux-hardening@vger.kernel.org, Lijo Lazar <lijo.lazar@amd.com>,
 Kees Cook <keescook@chromium.org>, Yifan Zhang <yifan1.zhang@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Kevin Wang <kevin1.wang@amd.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Le Ma <le.ma@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Zack Rusin <zackr@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@Intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct vc4_perfmon.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index bf66499765fb..ab61e96e7e14 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -76,7 +76,7 @@ struct vc4_perfmon {
 	 * Note that counter values can't be reset, but you can fake a reset by
 	 * destroying the perfmon and creating a new one.
 	 */
-	u64 counters[];
+	u64 counters[] __counted_by(ncounters);
 };
 
 struct vc4_dev {
-- 
2.34.1

