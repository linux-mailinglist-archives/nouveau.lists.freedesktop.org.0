Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B887A8C9234
	for <lists+nouveau@lfdr.de>; Sat, 18 May 2024 22:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B23E10E1CD;
	Sat, 18 May 2024 20:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gl2OouVw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A2510E1CD
 for <nouveau@lists.freedesktop.org>; Sat, 18 May 2024 20:21:58 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1ee5235f5c9so40640415ad.2
 for <nouveau@lists.freedesktop.org>; Sat, 18 May 2024 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716063718; x=1716668518;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YT8k8s66KczJAsNizHEAZ30DCNByiIsnyYkGU9dE27E=;
 b=gl2OouVwqA5JRctsPEcAp230+jOYRPIXlw5YxpjZfZqB0P3cx5/tgXSQY9rLLoaXbJ
 m1BGplhO2/o5Mku0SWDXbZOQthkb6x0ia1Fs2X2j1fNAPvHJPGEXa7FQOsdOvfbPaQFd
 HM6f8hXTVqIHrSdHa2zGAJ4/9DMwNgBhaki8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716063718; x=1716668518;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YT8k8s66KczJAsNizHEAZ30DCNByiIsnyYkGU9dE27E=;
 b=kM6dmbqqXmSQVUv1iZjNqboN1C3MDeMZvo7FzQ8ZhXWJnGAMXKpr3vMoYDSc23V1R9
 oAEBFpec5MPD05wG2cAl9CL9ofxL6SKpTSWqnvrViRiLrPSa8gLexs4I2vFPsI1hJZUY
 xNqRWYbqFHeXG4QeOmc1GSvDe+/UsWRH6eqSVWgBdy/LCuhw7MVqusLdqGXsbQRAbRmJ
 WLgcu9OGmDkgAnk2+XVFH6IEURKMySqzdTLhX6uG2tWoUyp5djK60VxmOGPkYZs+i0C4
 UpeJuF2eNloTzWt/dsjzlnEvj0k67Qjfx95BwKu/cRWTMYvuNlc59njx00ZqN9UdE4FR
 8UOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAeI6IyMfirQKhTZfbbqd5m2kg4zd3QY13yhUx+jG4qafoIOoP9lCE0qL1dwIOx8phfJfYZkG+RXklcp5YiASIRDM8bcnmE01XuyXCBw==
X-Gm-Message-State: AOJu0Yz5CDC8lcA4FptDiFM1wcwCZtGe2NwYAB0XQzv2KQC1V4bkllJ6
 eCCFMN5mGYiAxzy52vhHow26zCziQyT8Rn8x/2cw7d7fwi14g45kST05pGyWfg==
X-Google-Smtp-Source: AGHT+IFRGo/TZiGmDwrA4Giz9YhglZ2J52uHVSyaj/8zAhYj57i0W4kcw475tSgmL53i3sy/nIfz7g==
X-Received: by 2002:a17:902:f705:b0:1ee:b47e:7085 with SMTP id
 d9443c01a7336-1ef43c0c957mr310157785ad.12.1716063717708; 
 Sat, 18 May 2024 13:21:57 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bad61c7sm177715425ad.68.2024.05.18.13.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 13:21:56 -0700 (PDT)
Date: Sat, 18 May 2024 13:21:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Airlie <airlied@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
Message-ID: <202405181321.BE7CB28587@keescook>
References: <20240518182923.1217111-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240518182923.1217111-1-linux@roeck-us.net>
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

On Sat, May 18, 2024 at 11:29:23AM -0700, Guenter Roeck wrote:
> Trying to build parisc:allmodconfig with gcc 12.x or later results
> in the following build error.
> 
> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
> drivers/gpu/drm/nouveau/nvif/object.c:161:9: error:
> 	'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
>   161 |         memcpy(data, args->mthd.data, size);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
> drivers/gpu/drm/nouveau/nvif/object.c:298:17: error:
> 	'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
>   298 |                 memcpy(data, args->new.data, size);
> 
> gcc assumes that 'sizeof(*args) + size' can overflow, which would result
> in the problem.
> 
> The problem is not new, only it is now no longer a warning but an error
> since W=1 has been enabled for the drm subsystem and since Werror is
> enabled for test builds.
> 
> Rearrange arithmetic and use check_add_overflow() for validating the
> allocation size to avoid the overflow.
> 
> Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Yeah, looks good to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
