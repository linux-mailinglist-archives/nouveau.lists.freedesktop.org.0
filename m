Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901998A7B44
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 06:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4B1130DF;
	Wed, 17 Apr 2024 04:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fHC2Yamh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BF01130DF
 for <nouveau@lists.freedesktop.org>; Wed, 17 Apr 2024 04:15:44 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso6694805a12.2
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 21:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713327342; x=1713932142; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nUB4g5sijNmBMpDOpb0wBkjwbbVyQkxsCplWSUK9DPQ=;
 b=fHC2YamhwPCVOSQ9wK4fRfPhEyCFE+y921DZsgDBafG/uTKm2kr4TFvESChDqxfD5W
 5HastCymS6/V0EZh4CwihXG4syVuKF8GTpXtNh858XP++lVVna63XtQBccdNq2jmVMp7
 Hf/piD6uRXHyffG0/aSC3TxtEgX9WCBO9YGFmPGY+e+bh3xUepYqcPwBGkuuhPvJRs3N
 Ys7HmsALWKbn+48Qo56fMBe7S0SbG+WTbLKOBHI1I/b3eOOkSuyKAaZVbThEFSnyTpR1
 B31e5fi0N7grkqXd2O/IBBq9NJ8sSKAaMJhE6LV+pzl/D3CAkDQogalftrdkLavyteCy
 tpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713327342; x=1713932142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nUB4g5sijNmBMpDOpb0wBkjwbbVyQkxsCplWSUK9DPQ=;
 b=h74OllePbjT2T+CIQTMxmJIXi/1O/HCbXL941+fDw0pDgTfNUyPzANPn+PCE0cvOGj
 CRX3qr3+5q8UfNuGrGl8twyyGBvenDGXaxv98tzoUzWib5+/OO++yLxF8rl2k5m8TYAy
 bNPP6JdOqDI3ged/mLJyuK4ucqcTNWujV7imhfkYABehx8T/1Hx5PuUDxERWTKI96s7C
 HztqZWrOj/4O2MK5GymnVOaP8vQbhdxDYg0t0z0HDtYXJnK/AhVNc8qD8gA2xQ7aONtl
 UGxnqa7Pj4PEeXuvNUkkZ98leEGYCI3VWGqK5z75hZdWXTS2gxOZuvFWqZghNQS9nyy2
 EdUg==
X-Gm-Message-State: AOJu0YySTfC7ALr8ultQvU6wedk0szNehW4ou/5BorDZOCreD/Xk0yGj
 GCreUt/eHdfYF9hZD+e7Fsxqj/Jw36KiX/qfo9T1NfjfAgzrBpjtITV4OkMJFC6voCSWFZO8Ovb
 WDbaei1RSWPoPn6SCy/EWlG8Rl3s=
X-Google-Smtp-Source: AGHT+IGCmwYQm3tlomRw7mbCMmjzfHwK6DjeufPY1pcRqUMjVDJeCCVoZTdnoYaHwJjHUtx+YVCMGKfy0v9ZOANa0gs=
X-Received: by 2002:a17:907:983:b0:a52:19cb:fb48 with SMTP id
 bf3-20020a170907098300b00a5219cbfb48mr11329559ejc.77.1713327342051; Tue, 16
 Apr 2024 21:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240416234002.19509-1-bskeggs@nvidia.com>
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 17 Apr 2024 14:15:29 +1000
Message-ID: <CAPM=9tyW=YuDQrRwrYK_ayuvEnp+9irTuze=MP-zkowm3CFJ9A@mail.gmail.com>
Subject: Re: [PATCH 000/156] drm/nouveau: replace "ioctl" interface between
 drm/nvkm
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 17 Apr 2024 at 10:57, Ben Skeggs <bskeggs@nvidia.com> wrote:
>
> This is a series of cleanups that I intended on doing after posting
> the initial GSP-RM support several months ago, and have now had the
> opportunity to work on again.
>
> The main intention here is to replace the ioctl-like interface that
> sits between NVKM and the nouveau DRM driver with more direct calls,
> to reduce the call-chain complexity (and overhead).
>
> This is achieved by having NVKM return structs of info and function
> pointers specific to each class, along with an opaque pointer to its
> private data.  These are stored in the NVIF structs and used to call
> directly into an implementation without handle lookups and multiple
> layers of indirection.
>
> There's room for further cleanups and API changes from here, but for
> now most of the API usage is exactly as it was before, as the series
> has gotten quite large enough already.
>
> The first part of the series starts out by cleaning up some of the
> interfaces within the DRM driver, and reimplementing the subset of
> "ioctl" interfaces needed by userspace directly.
>
> A number of unused interfaces/function args are then removed so that
> they don't need to be ported, and some initial renames/preparations
> are made to the NVKM's user object implementations so that diffs of
> the next set of patches are more straightforward to read.
>
> I then go through each class in turn, starting from the root of the
> object tree (client), and working up from there.  The object ctors/
> dtors are ported first, followed by sclass/map/etc, followed by the
> class's methods, and then repeating the process with each of their
> children.
>
> Objects remain accessible with the "ioctl" interface throughout the
> changes (until their last use, after which they're removed from the
> object rb entirely) to allow each change to be done independently.
>
> After all classes have been ported, some final cleanups are made to
> the DRM driver to complete the series.

Welcome back!

Do you have a git tree with this in it, since I think at least patch
25 got stuck in moderation.

Have you tested nouveau GL and nvk on top of this?

Dave.
