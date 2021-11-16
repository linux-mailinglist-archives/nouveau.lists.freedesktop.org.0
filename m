Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F002A459700
	for <lists+nouveau@lfdr.de>; Mon, 22 Nov 2021 22:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CF189DD2;
	Mon, 22 Nov 2021 21:52:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 16 Nov 2021 06:05:38 UTC
Received: from mx-lax3-3.ucr.edu (mx-lax3-3.ucr.edu [169.235.156.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C7B6E94C
 for <nouveau@lists.freedesktop.org>; Tue, 16 Nov 2021 06:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1637042739; x=1668578739;
 h=mime-version:references:in-reply-to:from:date:message-id:
 subject:to:cc; bh=Z3Zujelhp95n7JiGO15pEnuj1r6cZj7PyaJcCYcZCrc=;
 b=WRyfEVyzsvm7pJGPjszSA4HnXd1cIUYJWgx4Evz4UdPKobi3LAP8+FGR
 C1bylyZ08m24ZUrjn+XOJuFcWpU/2JLlcFJeMseLvWdI7mvZQnqT0ZENC
 R0CRMJgUfwDrdagWf9tc0IdG2MeEl9xZFdhXPi+fYFYf2kgN1FcUx19IO
 x1vUysclKeO3pyGmoKE/qVt5JTOijQS72OtrVVnfKbTABT09UgLDu4itQ
 vG6+tjwRRhr/VSC0yGHXvjCPTSBDdFY9hZ05JR3k1jvr3Ahf/x1Y1FlRx
 ckhmokL8PZ8+WeiTq/xl8TzNY+rurlPLGCIyPNcoLI+koM0srf8kSmjDS Q==;
IronPort-SDR: IcQ/pcOxBUM8teMchpgq28OCiwUeaCdLw1fARCKGvbT+dNvPs390zlWuF1h/vGku4mySVExjrL
 19qHMZctH1MD+rTyyNxzGxCL+Sc7ato6f7abpoaCZ01LEyGU4IHmSCcu23yRueqNcs5tXLTyvW
 K/+iNRPR1Af0wjhLBDqSSaFKVQnFgefLtSrSrZlcYdFugZQklUQkfhAtunAKy2qfc1PxIXZ2gu
 B/tHR8olvmgHnXZWTvvBdVLDCVH49w5ZdllQVQf10NWFhMJcpBq3zhHFoma1UD4YXriCxpbQZT
 KibeQrP6XJeM2BBXZ2IecjH2
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="86384917"
Received: from mail-yb1-f200.google.com ([209.85.219.200])
 by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2021 21:58:31 -0800
Received: by mail-yb1-f200.google.com with SMTP id
 s189-20020a252cc6000000b005c1f206d91eso30602502ybs.14
 for <nouveau@lists.freedesktop.org>; Mon, 15 Nov 2021 21:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/XhVolQXCHPmPCzdRzFWhpIuM6H2Dzx9QQPO3TDOnQ=;
 b=f867r1i2Ostx6BltPr4Oc+FLyknNCfRZZ8l/kHRJB8wnAdh1Z+85jOUgfhVaqYWG43
 PnHHT6jy+L7VBZdHouMBNsvuWuuto8figPchs2mldQ8qtJC5qaOraraScvZVlbxxkf4L
 SkpkgUNLz56wCGs3dil3hUuNC1TeoZwqBwW/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/XhVolQXCHPmPCzdRzFWhpIuM6H2Dzx9QQPO3TDOnQ=;
 b=1+YfL2mHOCpZTz8kGlxsAKZNlp3B0MlbS/UqeENumrml8fxHrYNZLJIUIngJFCog0p
 LNZmfFz3WX18YQDyXxhyGkRTF3TRwMe9Gw+KZraORkG00TFDZ22vPAFWMVy4z3YjpqvJ
 rM9ZhjtL/4Nsxn6mc2P3t/yn9P1xl9Rj1u45ASAsxBpy8Shci2XkjnSPzydcbO0PFFgw
 Dw5rQSh3GRKxIakHFVBMImClJkjPZGcLBVQdsvb6ejz6cIR2WB9eJGzjBxgtaoYv/QKG
 dLaYP/CK2qa2hOEiF9ZAm3Gk8Q0M1iP4w/bsMj77UZihLrijLXd3pxNctrzmVOp6qBkQ
 FtEQ==
X-Gm-Message-State: AOAM531PxREYtE6RBlKoongNzf7ln6zLZgjwbOKk9XKQ5jhZQvMOR/7N
 OFW8drQ+zQgp0gheimWhQ770NQdVrCoaDKbhVNg+1tIki5huIrIDEGoG4rn5zefiiokqqazGq/0
 SgS9pPiHblWfKFkhkKSkHzjUa88eefLBHvtFc7C11Uso=
X-Received: by 2002:a25:d103:: with SMTP id i3mr5547196ybg.260.1637042310185; 
 Mon, 15 Nov 2021 21:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwUr/rkQjN0wPIocSPR9Ha22HtX3sCwe21HdQmlEhLyrgEeqa6u/wE7tEwiSL8OX/t6aAWemYEafgo1TEtMxs=
X-Received: by 2002:a25:d103:: with SMTP id i3mr5547162ybg.260.1637042309942; 
 Mon, 15 Nov 2021 21:58:29 -0800 (PST)
MIME-Version: 1.0
References: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
 <CACO55tuDQ9UC2rr=_Hsowvujk49oNK1zWfHj3jMnhEqsTAnh0Q@mail.gmail.com>
In-Reply-To: <CACO55tuDQ9UC2rr=_Hsowvujk49oNK1zWfHj3jMnhEqsTAnh0Q@mail.gmail.com>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Mon, 15 Nov 2021 21:58:19 -0800
Message-ID: <CABvMjLSFLpG4=+tE3Sr2wfRsEuKLXMm++Xx+JNmA8YXptgzkmw@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Nov 2021 21:52:42 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/core: fix the uninitialized use
 in nvkm_ioctl_map()
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Karol:
Thanks for the feedback, the patch might be too old to apply to the
latest code tree. Let me check and get back to you soon.

On Sat, Nov 13, 2021 at 12:22 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> something seems to have messed with the patch so it doesn't apply correctly.
>
> On Thu, Jun 17, 2021 at 9:39 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
> >
> > In function nvkm_ioctl_map(), the variable "type" could be
> > uninitialized if "nvkm_object_map()" returns error code,
> > however, it does not check the return value and directly
> > use the "type" in the if statement, which is potentially
> > unsafe.
> >
> > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > index d777df5a64e6..7f2e8482f167 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
> >                 ret = nvkm_object_map(object, data, size, &type,
> >                                       &args->v0.handle,
> >                                       &args->v0.length);
> > +               if (ret)
> > +                       return ret;
> >                 if (type == NVKM_OBJECT_MAP_IO)
> >                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
> >                 else
> > --
> > 2.17.1
> >
>


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
