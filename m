Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 362307B3AB8
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 21:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1307A10E1B2;
	Fri, 29 Sep 2023 19:34:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C8010E1B2
 for <nouveau@lists.freedesktop.org>; Fri, 29 Sep 2023 19:34:02 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso130498685ad.2
 for <nouveau@lists.freedesktop.org>; Fri, 29 Sep 2023 12:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696016042; x=1696620842;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ym+ucW6MHQZimVVr4/aWJAbaMhbjuFeNaLImS0cTOp0=;
 b=TixVQg9xRTeGHwlfS9n7MYmhEjXR+UZBfzh37C5jBHYIYqFoQfwdyK1wK+Tatkhd2E
 0h85oIfUEYFLzsfSV9ee8gE63919elODziLyRQ2VU4R6CyT0ZhWmfXgTpT+gha4ejyuS
 HiFdd1skfdqQsWthB0iAnmt3peidGawHG0cXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696016042; x=1696620842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ym+ucW6MHQZimVVr4/aWJAbaMhbjuFeNaLImS0cTOp0=;
 b=MA1DbZviIy5k4vfOlo72LHz5tB/HmPzH/NDGwEoRqznzYj/rJnDA7caGgytD2bdGSI
 GO1JmTBLBlJ0kXZsSFtZuTf25mgW28lXvmBDfS5bYAIwMytQNS2galNljDUF5LCnpwNF
 nj/FKzXYclMOYwsgSdyvIzgmoCqfHNbEM6Z1oTCc7M5UNcTpMjiI0ie1eENooVlVndtz
 qNlyQfdWHGPKsoqjKhprX2kB43ZUHQh40M2RHuKQeqVD4l3Pm94WyLAggR45TGF64cx1
 xx2NCu5LBQ2p9eKvUjn5vcc+jCuNAcKbKxFFsvY9sxHmtP5LIuNbG4kjQet2dPt96v1E
 GymA==
X-Gm-Message-State: AOJu0YyRvGCc7L1k9kg1JDa0dUigyM21UCmsEgijoQV0+sLj4XAaLJ+7
 KZahfNb+U2YWsrLfcKL5+hRKIw==
X-Google-Smtp-Source: AGHT+IGQWTdEpdWeBEvd5foAb6HBvD/EqemA8SP9BycZ81OPm2PcYAndv1e0P5bQalrHP7ERsAZdBw==
X-Received: by 2002:a17:902:720a:b0:1c1:dbd6:9bf6 with SMTP id
 ba10-20020a170902720a00b001c1dbd69bf6mr4494391plb.41.1696016042045; 
 Fri, 29 Sep 2023 12:34:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b001c61df93afdsm10225856plb.59.2023.09.29.12.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 12:34:01 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>,
	Kees Cook <keescook@chromium.org>
Date: Fri, 29 Sep 2023 12:33:24 -0700
Message-Id: <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 0/9] drm: Annotate structs with __counted_by
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
 Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Melissa Wen <mwen@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Le Ma <le.ma@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Zack Rusin <zackr@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@Intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
> This is a batch of patches touching drm for preparing for the coming
> implementation by GCC and Clang of the __counted_by attribute. Flexible
> array members annotated with __counted_by can have their accesses
> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
> 
> As found with Coccinelle[1], add __counted_by to structs that would
> benefit from the annotation.
> 
> [...]

Since this got Acks, I figure I should carry it in my tree. Let me know
if this should go via drm instead.

Applied to for-next/hardening, thanks!

[1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
      https://git.kernel.org/kees/c/a6046ac659d6
[2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance with __counted_by
      https://git.kernel.org/kees/c/4df33089b46f
[3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
      https://git.kernel.org/kees/c/ffd3f823bdf6
[4/9] drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
      https://git.kernel.org/kees/c/2de35a989b76
[5/9] drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
      https://git.kernel.org/kees/c/188aeb08bfaa
[6/9] drm/vc4: Annotate struct vc4_perfmon with __counted_by
      https://git.kernel.org/kees/c/59a54dc896c3
[7/9] drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
      https://git.kernel.org/kees/c/5cd476de33af
[8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
      https://git.kernel.org/kees/c/b426f2e5356a
[9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
      https://git.kernel.org/kees/c/dc662fa1b0e4

Take care,

-- 
Kees Cook

