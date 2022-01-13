Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E642648D93F
	for <lists+nouveau@lfdr.de>; Thu, 13 Jan 2022 14:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D3B1124FA;
	Thu, 13 Jan 2022 13:44:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC78B1124F8
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jan 2022 13:44:30 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id 66so78284ybf.4
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jan 2022 05:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t4iOUVFv53bNQSQ/gO0aroSu848/nmRUJMS9RO8UVKs=;
 b=L3t/7x5E6+oOdmCJJKKVoRGWTgQRkrBeAvTi/BR6XX6Q5XLRVBspgMP0moqqe1UGKu
 ddfQ5RrHcPahfVgeYOmn5AHJlMWc+TOAeWBWMgyMUnrivvh+PMMHgT209bAyuKNQKk3P
 k5e1boYAvB/kJ+LnMsQsDhZiHUXhb1sNYO6pAdHkXjVzD2b9imk89CO5pjBTJ1gRqmjn
 1rGkYILN48K3Xm/0nFyBivNcRKr+prkJFgLFQudXjewMCIb583bksfZpHF2EAupjIetP
 8tVVIFo+S6Vc8JE8qXdS6cSLm37UHqx/W5t6Ee+cWLutbIkIgEgGhIgQ0VWxA2nXMH26
 UgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t4iOUVFv53bNQSQ/gO0aroSu848/nmRUJMS9RO8UVKs=;
 b=WRu+2ZABeYOQS1UC7ViZ5ljyMD7RdSTxdrO3lKRqKEEG1km1/TWYhtuh/0T5aO0iT8
 qUw6RN5JpZxv+eIFXyDdzHgwq3IgUcSjMrhVnfHwTmgGaDVTLkIrTuaMZsPi2UG6HFDQ
 kvDbLLFwbwtPyHYVCHlnd1FmAR3Vih4jGdv/5I9qvMDhv3qXek76aeE7fmqoJJi4E03S
 MftvEbRDJUUnQkWIkylz2iO//+EENRnWdrlI1QFEI7wKPGHeM8jj02Zs1G5TBEyLaB2G
 85kV3MciX1fFSr0ZrGHqi/+MfVMph4xqA+CpkBZU1P7JdNHL+IwSjyPE6em93cBgk7iw
 ZS0w==
X-Gm-Message-State: AOAM533I3v9PeTRTINY2IHPHR6phwDslf9hVxU/M+u3uQEOfWv4YCIpz
 vjyh4L5msqDGc1zB4XO2b7+2XTA3bHysYt6A9S9CYw==
X-Google-Smtp-Source: ABdhPJwo6URqBePslK+oKLzNiKNduFsi241hMu0BUXNptg5RSut3Cj4rzAH5lLArTqXi4SXz//NaTZwj4mHiagIizJ4=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr5871202ybc.59.1642081469812; 
 Thu, 13 Jan 2022 05:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20220113094419.12433-1-etom@igel.co.jp>
In-Reply-To: <20220113094419.12433-1-etom@igel.co.jp>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Jan 2022 13:44:18 +0000
Message-ID: <CAPj87rPk3_8LdnwWJ3BhtJnRuR+_WHg2hfdgK2R4SMacPGCrUQ@mail.gmail.com>
To: Tomohito Esaki <etom@igel.co.jp>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [RFC PATCH v2 0/3] Add support modifiers for drivers
 whose planes only support linear layout
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Esaki-san,

On Thu, 13 Jan 2022 at 09:44, Tomohito Esaki <etom@igel.co.jp> wrote:
> Some drivers whose planes only support linear layout fb do not support format
> modifiers.
> These drivers should support modifiers, however the DRM core should handle this
> rather than open-coding in every driver.
>
> In this patch series, these drivers expose format modifiers based on the
> following suggestion[1].

Thanks for the series, it looks like the right thing to do.

Can you please change the patch ordering though? At the moment there
will be a bisection break at patch #1, because the legacy drivers will
suddenly start gaining modifier support, before it is removed in patch
#2.

I think a better order would be:
  1: add fb_modifiers_not_supported flag to core and drivers
  2: add default modifiers (and set allow_fb_modifiers) if
fb_modifiers_not_supported flag is not set
  3: remove allow_fb_modifiers flag

Cheers,
Daniel
