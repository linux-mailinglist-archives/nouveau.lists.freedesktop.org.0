Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB516ED130
	for <lists+nouveau@lfdr.de>; Mon, 24 Apr 2023 17:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA35B10E4A4;
	Mon, 24 Apr 2023 15:21:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7F010E363
 for <nouveau@lists.freedesktop.org>; Mon, 24 Apr 2023 15:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682349701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9mLtuhNzL4W66bGMVKcTb36aTtFdYTyTbAVeY28DY4=;
 b=gCyH4L7TnMsZueFsBXCxZugx2zdtcC+Uhj1qoEE156Ng4gffSgP/5oki6UcXyEUG82w1Nx
 ApEk9tOD558bYA4hqkweQZc2UZsWYe4tmZkutLvOIGMGPh/ixpVqngrAO/qmDbhVa6tyhG
 2JbO9mtAxg9rbDV65mJnj7WPIDkja5Y=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-Q0EIeminOjOh2HenIC2Yvw-1; Mon, 24 Apr 2023 11:21:40 -0400
X-MC-Unique: Q0EIeminOjOh2HenIC2Yvw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4ec55b6b585so721697e87.0
 for <nouveau@lists.freedesktop.org>; Mon, 24 Apr 2023 08:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682349698; x=1684941698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9mLtuhNzL4W66bGMVKcTb36aTtFdYTyTbAVeY28DY4=;
 b=DcaIoK9lkVNit+w7tzCxO7o8BNF3eMOjn3l38CnLE5Aemjr8WinKQos9fGOyFClvGY
 78FlijdM/z2jk+18viksOmVpWTWa/ukvSOGKf1lvkKtRE5AAjiMd+cG3bqNZaAzCuPmZ
 WgsqFSPgxGOQCuroDX4+QKKh1oWFmVI2jY+jl8N1dSDVCua8woca6jGLsrYB/aCHy6kj
 kXKF1Wnx60KP/xLGxg9L+IT+HTUGjoXsVwT9jESENgBB6XWgFBun2/SbSzy0ZNnuMlkD
 tngewwE7LZFpqxUwjxzfNUeRmd/+TWmwcPuj1pK9RSZePyJkye5cNRX5kw2c302pDyel
 sKhw==
X-Gm-Message-State: AAQBX9dPNxj3rxTj8hK6KkOs9LeurgEe4iu4lsviDs97iq/XDCMSMT3+
 WxFS8tzfYs6RdO5FO3LXuYPJyqTiVVTMwDkYUFmDTO8wwTiWKF07onUie6lwrfxsfp4p3rt49Vq
 9J99hfDQnK1l6Bfsm7CPjs5c+LjyX3pDbm+FB9R7yCjwo4k+6lg==
X-Received: by 2002:a2e:bea2:0:b0:2a7:ab72:1687 with SMTP id
 a34-20020a2ebea2000000b002a7ab721687mr3595012ljr.5.1682349698371; 
 Mon, 24 Apr 2023 08:21:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350YxGt6Cwo4tIqSGLrVoLpjanytXyrNDC0r+4Mb8YdvhCBq1mG2uXlYEQc0hcpiACAZU/uRrtQYtpZLEX+kTCpc=
X-Received: by 2002:a2e:bea2:0:b0:2a7:ab72:1687 with SMTP id
 a34-20020a2ebea2000000b002a7ab721687mr3595004ljr.5.1682349698092; Mon, 24 Apr
 2023 08:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
 <D57F9A07-AB77-4FF9-B0A6-C502DC60D093@kernel.org>
In-Reply-To: <D57F9A07-AB77-4FF9-B0A6-C502DC60D093@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 24 Apr 2023 17:21:27 +0200
Message-ID: <CACO55tvLHh4jfdT==t=B9JpPGEH-5vnEE3Q6AfJWZ_v_1uC6pg@mail.gmail.com>
To: Kees Cook <kees@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Disabling -Warray-bounds for gcc-13 too
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
Cc: Kees Cook <keescook@chromium.org>, gustavo@embeddedor.com,
 nouveau@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 qing.zhao@oracle.com, Ben Skeggs <bskeggs@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Apr 23, 2023 at 10:24=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On April 23, 2023 10:36:24 AM PDT, Linus Torvalds <torvalds@linux-foundat=
ion.org> wrote:
> >Kees,
> >  I made the mistake of upgrading my M2 Macbook Air to Fedora-38, and
> >in the process I got gcc-13 which is not WERROR-clean because we only
> >limited the 'array-bounds' warning to gcc-11 and gcc-12. But gcc-13
> >has all the same issues.
> >
> >And I want to be able to do my arm64 builds with WERROR on still...
> >
> >I guess it never made much sense to hope it was going to go away
> >without having a confirmation, so I just changed it to be gcc-11+.
>
> Yeah, that's fine. GCC 13 released without having a fix for at least one =
(hopefully last) known array-bounds vs jump threading bug:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109071
>
> >And one of them is from you.
> >
> >In particular, commit 4076ea2419cf ("drm/nouveau/disp: Fix
> >nvif_outp_acquire_dp() argument size") cannot possibly be right, It
> >changes
> >
> > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> >
> >to
> >
> > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SI=
ZE],
> >
> >and then does
> >
> >        memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
> >
> >where that 'args.dp.dpcd' is a 16-byte array, and DP_RECEIVER_CAP_SIZE i=
s 15.
>
> Yeah, it was an incomplete fix. I sent the other half here, but it fell t=
hrough the cracks:
> https://lore.kernel.org/lkml/20230204184307.never.825-kees@kernel.org/
>

left a review on that patch. Any preferred way of getting it upstream?
I could push it through drm-misc, but the delay until it reaches
Linus' tree is a bit high.

>
>
> >
>
> >I think it's all entirely harmless from a code generation standpoint,
> >because the 15-byte field will be padded out to 16 bytes in the
> >structure that contains it, but it's most definitely buggy.
>
> Right; between this, that GCC 13 wasn't released yet, and I had no feedba=
ck from NV folks, I didn't chase down landing that fix.
>
> >
> >So that warning does find real cases of wrong code. But when those
> >real cases are hidden by hundreds of lines of unfixable false
> >positives, we don't have much choice.
>
> Yup, totally agreed. The false positives I've looked at all seem to be si=
milar to the outstanding jump threading bug, so I'm hoping once that gets f=
ixed we'll finally have a good signal with that warning enabled. :)
>
> -Kees
>
>
> --
> Kees Cook
>

