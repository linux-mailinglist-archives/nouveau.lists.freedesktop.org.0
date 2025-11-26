Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B45CBABAA
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBC310EAFF;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fX2GVEgg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE5710E634
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 14:20:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42bb288c1bfso3989536f8f.2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 06:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764166825; x=1764771625;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K+mX3K4EZWXpumEvNCBx9+WunDYcwtTk4SgV9tqSlww=;
 b=fX2GVEggeIWwyylfupsU7FBjTHVurzr+2/wLA4JYqFyPpSdW1ACtsnasbEzEGi/+jk
 GV3cul1rsJwyoKSR8BbeMDO3kO1ZojVFkZguyRs0TvQRlvuXstL6CEWgPmDJiFLccD4k
 0ZEz63OjmIoeQ3osSloCV0wOVvYm1UheVQnx+cjwEmm9Hd//8Uchq6MLQ3w/3MhqzLRn
 A8Eec3RLNi80SWAiMY0hhSxw9uT3sVu0NosVmJWV2RLKFtR7pEcgSuvmpiMJlvHTmgIi
 g826fUMFIU6hTK8jSn8gLtiDO2++fSxMjw4J+yjimXdl93p8FN7Ex1Rrc0/FieleWm8d
 nuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764166825; x=1764771625;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+mX3K4EZWXpumEvNCBx9+WunDYcwtTk4SgV9tqSlww=;
 b=MIRiG/23qyYQiMEXVmD8NHXHts1KqkkijLcBKKT+dRshCgF9fpmD4OwESsfFpCmcCY
 uiGvhYVi91zwc631h2RJaH7d6Lc58ymhcuzXv5CZiWDHdgLEvNcsr0XCDeFp2mOVuf75
 4F0amnuNkYO9RTwiAn2YquuvNilPAGHIXPDlxzTifzukPRGKVIRi1HJZp4hlrdfqmnzQ
 3cNZgrnNt0tGVs3+ZenWDQm7lMJB/WWBAx5L17R9FlrlR9k1bzKcif1fiEedeXj0CLhj
 mebRHZLcNNdBfGLBRb5oDg1Im/4gld5IzDSVryZKcLcai/Wvc5474i6rQYTIpSLSZby/
 /P6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3uLIFFS7N5ZM3fSjhmCXGKKU4+O41lN/QvIsD+4xLe8CgPqWi7vDK/LHoOwMGKI6xry51uzZr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/pewCHkb0gTGWltjRdFVbvRr53FPq9xDT9Jk9kJ6FfL+Z7Ssu
 hgOFxYvYJMkSWKsg1C26OnwYAS5K9/OhRhibDnp6suO+V7CLDBvrrq5YB6BF0Ibv+ag=
X-Gm-Gg: ASbGncvuc7hXILbc2NEGvz9wBPMakCXqgXfaT+kfg+HX1ZweT4tAPW4kHv2+VSufMhr
 Rt37jSQcrzNLkbnvgSGC/AYXDH52kBkPO9pC9B+b5fglvnvQvnCm5v65RM4HvxcY8CvBNB8mEzY
 raxQ7GqFfLNyYzcc39wZv4+SGVJr1uIbUXwJPk12RiaKybJG8/odhG9rgZkhuATWPrRN3rmM/7Q
 JBKZF0DAVp7013UGim8DgsgjJ+2SgrbLDSDVoCLBFXsTP/co7scW1lxhpzdwtvh4SU9CAnNBZdl
 Sys6u34JCC568m6Fe6OiJmf99pv4hcxQAq5PspVzFaoKd0DggSUlpzQqky4npRtO7qTtx09wHf4
 mRKy6kQVlGzHEGQFL3Gb2h47gWQtBcOmh1gn4cab9ZO9hXT94TijUFSyPHHAMREZ8c9ATEJsama
 2M5buazNdFFNEuY3XlBqR0C0b0WVW5jt9ahNV9PIzOJGPNIJUkzTucW74nUoCXtk7TnXKxhA==
X-Google-Smtp-Source: AGHT+IHetDpaeSCLD158eeBfnLMa77d0GWcu9KkUU/dpWWOreiarVBFn16/gIezMUQj2z9CZm6a8yQ==
X-Received: by 2002:a05:6000:40c9:b0:42b:3806:2bb7 with SMTP id
 ffacd0b85a97d-42e0f1e35c2mr7360017f8f.6.1764166825367; 
 Wed, 26 Nov 2025 06:20:25 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fba20esm40814603f8f.37.2025.11.26.06.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 06:20:24 -0800 (PST)
Date: Wed, 26 Nov 2025 14:20:22 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson <danielt@kernel.org>,
 Doug Anderson <dianders@chromium.org>, simona@ffwll.ch,
 airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org,
 deller@gmx.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jason.wessel@windriver.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nir Lichtman <nir@lichtman.org>
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
Message-ID: <aScMprMh6Eh4JU5D@aspen.lan>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
 <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
 <aSbwWLTLe0bMhOKV@aspen.lan>
 <054f60ca-b898-488f-81f4-14eed0a1360b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <054f60ca-b898-488f-81f4-14eed0a1360b@suse.de>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

On Wed, Nov 26, 2025 at 02:32:32PM +0100, Thomas Zimmermann wrote:
> Hi
>
> Am 26.11.25 um 13:19 schrieb Daniel Thompson:
> > On Tue, Nov 25, 2025 at 07:26:33AM -0800, Doug Anderson wrote:
> > > On Tue, Nov 25, 2025 at 5:06 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > <snip>
> > > > Therefore remove the remaining support for kdb from the DRM drivers
> > > > and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> > > > there are no fbdev drivers with kdb support.
> > > >
> > > > If we ever want to address kdb support within DRM drivers, a place to
> > > > start would be the scanout buffers used by DRM's panic screen. These
> > > > use the current display mode. They can be written and flushed without
> > > > mode setting involved.
> > > >
> > > > Note: kdb over serial lines is not affected by this series and continues
> > > > to work as before.
> > > >
> > > > Thomas Zimmermann (5):
> > > >    drm/amdgpu: Do not implement mode_set_base_atomic callback
> > > >    drm/nouveau: Do not implement mode_set_base_atomic callback
> > > >    drm/radeon: Do not implement mode_set_base_atomic callback
> > > >    drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
> > > >    fbcon: Remove fb_debug_enter/_leave from struct fb_ops
> > > Personally, I've never worked with kdb over anything other than
> > > serial, so this won't bother any of my normal workflows. That being
> > > said, at least as of a year ago someone on the lists was talking about
> > > using kdb with a keyboard and (presumably) a display. You can see a
> > > thread here:
> > >
> > > http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org
> > >
> > > Daniel may also have comments here?
> > TL;DR - I'm pretty relaxed about these changes... but I'd like
> >          to know how to test the changes.
> >
> > Like Doug I only really use kdb via serial but, since I'm maintain
> > the thing I do occasionally test kdb works on the qemu console. I don't
> > do it very often though because it's a manual test!
> >
> > I'd assume that will still work since it won't involve any of the
> > drivers above. I'm afraid I can't double check that since patch 4
> > doesn't apply cleanly in v6.18-rc7 (nor to linux-next... and neither
> > does the base-commit appear in linux-next).
>
> To test its effects, ignore this series and simply clear the two calbacks at
> [1]. This is where the debugger invokes fbcon. The series removes their
> implementation in the final patch.
>
> [1] https://elixir.bootlin.com/linux/v6.17.9/source/drivers/video/fbdev/core/fbcon.c#L3202

Thanks. Explanation in original cover letter was great and there's
certainly been no harm to QEMU.

Acked-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
