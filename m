Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CC744699C
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 21:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BB46E4CD;
	Fri,  5 Nov 2021 20:25:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3CE6E4CD
 for <nouveau@lists.freedesktop.org>; Fri,  5 Nov 2021 20:25:21 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id w15so10677713ill.2
 for <nouveau@lists.freedesktop.org>; Fri, 05 Nov 2021 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LrK07k0Lpn9CHC7K58jZi/mGEAzkF+QHwrwjm8onEpQ=;
 b=J5P2n9oSkKMVEby8FUnF9XKM7m7v29C9QXYnLi8ad3Gc0hFBr8XXUfoBnhnXCvQbCT
 jjaOYs//TeGM0x1WTuneAjydHwuzeXNZNwzHdKUuZS2sIpjpZ2EB5MdBULXyZcxFH2im
 KFtNl/2wO/3NMsNLqEPqj3//SqItdZo7l97A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LrK07k0Lpn9CHC7K58jZi/mGEAzkF+QHwrwjm8onEpQ=;
 b=yhmbdH7kGxW+DMe3XnnfL5o4szTiwqloHHOnQhCMiuGzXuHwu1bNz5NGUhyu/orhPA
 Tap6INqgnAczoIriMfIWEaKo6AWohGXccaJWgN7XGUVhawIOUqVtVEZ9lMhfO9WHB6LK
 YEAcDl9hdxrmTzJstJ7lOH4ajwm1YRe+OEXt1PBcEc0p1P/uIhs8diSiZ04I7W7GCPav
 +onIL9GkxgTx3GDJniqBc9UD6LJX3Xzzkgpf0neE9ekKNWbzm9sXdNMswX/kGUeptWtm
 gxMliKrhQIfFCJzk1D8YOnrPm7IkPUVXOyD/oTq/DwWt1qCZ+pp+e64kdybkFbXmtRsA
 jCDg==
X-Gm-Message-State: AOAM530sf8/ff+f+KF/JSlkp9ttCjQTFB2ZZ8r4SL9Q7GXfUdtlunvnD
 THb882o1P09TkpBic5cdoqvqzbOmsc458A==
X-Google-Smtp-Source: ABdhPJxj4B8392Ungemw2QqGxVe9C6oPF3i3uKd4VRPwG2nfD7ve35XhNtJIwZ1Iw5Y9akkdyhMTvw==
X-Received: by 2002:a05:6e02:19ca:: with SMTP id
 r10mr43585574ill.319.1636143920497; 
 Fri, 05 Nov 2021 13:25:20 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id b4sm4553901iot.45.2021.11.05.13.25.19
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 13:25:19 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id j28so10662015ila.1
 for <nouveau@lists.freedesktop.org>; Fri, 05 Nov 2021 13:25:19 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a67:: with SMTP id
 w7mr35042875ilv.165.1636143919429; 
 Fri, 05 Nov 2021 13:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211105183342.130810-1-lyude@redhat.com>
 <20211105183342.130810-4-lyude@redhat.com>
In-Reply-To: <20211105183342.130810-4-lyude@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Nov 2021 13:25:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VA53LyEA+jDfU6mQ0USwfSBiLK8KfWfc91U9X9f=oN9g@mail.gmail.com>
Message-ID: <CAD=FV=VA53LyEA+jDfU6mQ0USwfSBiLK8KfWfc91U9X9f=oN9g@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH v5 3/5] drm/dp: Don't read back backlight mode
 in drm_edp_backlight_enable()
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
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 5, 2021 at 11:34 AM Lyude Paul <lyude@redhat.com> wrote:
>
> As it turns out, apparently some machines will actually leave additional
> backlight functionality like dynamic backlight control on before the OS
> loads. Currently we don't take care to disable unsupported features when
> writing back the backlight mode, which can lead to some rather strange
> looking behavior when adjusting the backlight.
>
> So, let's fix this by just not reading back the current backlight mode on
> initial enable. I don't think there should really be any downsides to this,
> and this will ensure we don't leave any unsupported functionality enabled.
>
> This should fix at least one (but not all) of the issues seen with DPCD
> backlight support on fi-bdw-samus
>
> v5:
> * Just avoid reading back DPCD register - Doug Anderson
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 867cf9cd73c3 ("drm/dp: Extract i915's eDP backlight code into DRM helpers")
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 40 ++++++++++-----------------------
>  1 file changed, 12 insertions(+), 28 deletions(-)

You forgot to CC me on this one! ;-)

This looks good to me now, so FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
