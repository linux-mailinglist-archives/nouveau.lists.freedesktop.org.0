Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857AE6F0F0F
	for <lists+nouveau@lfdr.de>; Fri, 28 Apr 2023 01:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7409A10E202;
	Thu, 27 Apr 2023 23:36:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0096110E202
 for <nouveau@lists.freedesktop.org>; Thu, 27 Apr 2023 23:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682638560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtxdU5WlVdcb+XBppbz68qitJ4VGpE1Fcj7h16umcx4=;
 b=KYZQ42ilwb+qk2/2fmbNnfmHQ5jmDEX9WK6TKIH3R7Fotwc2RPXfF7B99uIoQYRKF9G313
 ABcK/8IsDs/DkvlgH6pyfxJ/NPmZHRbyTUbpq9R13lKTF4xczahN6Mc26K9J9rjoQUiwB1
 Ig0UHkhRMsbJf9L9eDJ0dA1dDiWBVBU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-ejytTgjBM0CeJuRwHh8qvQ-1; Thu, 27 Apr 2023 19:35:58 -0400
X-MC-Unique: ejytTgjBM0CeJuRwHh8qvQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4ec7b494be8so944595e87.1
 for <nouveau@lists.freedesktop.org>; Thu, 27 Apr 2023 16:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682638557; x=1685230557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XtxdU5WlVdcb+XBppbz68qitJ4VGpE1Fcj7h16umcx4=;
 b=JB61346ZFiQoVVxxiuxFD6Gq5MfBTt4EwNg8mTqfwRnUrLP5BcwMUaeUPlYfKZawus
 0+ez+EZtb65rLPnV46wG5HQ5zX/0kjT7Zm3Sm2kr8YjuPoZbmkeHZFPlCwCpgdVTbZ89
 Fq14mI5BLymIHo2JVMNi2SJ4koSDHt9kEWjzFniRJu+DC4bAvh1GchPrmG6yarf2Kvyk
 VXk8TyI9UfXSkWPK2lvWEE0NrWhFilV/c7X3denkAGTkTHTncz/6pMUzxzX4ATq6wC3t
 xnuVqIxtjWV/OzPCvUvsdc2OZT8qnk7u1NqVZcgK+NpMOCHOcMprVCLNAsp8Ub2G6yLq
 sn1w==
X-Gm-Message-State: AC+VfDwI9KIqMipD/cv+kUVmPTkBnc70SLLo5bDqVV4ftHyjCEMpQEJZ
 xwKPcQzzcE1SJHNZOX7XECT+qfV97L0giF5wIV8qc+cZudskloW8mOrgcj9oKi6k3z+qq3aaple
 TeAnK6tjMzKLsL5wykPBSW7cPWAfgkzL5MtIwdHk2Uw==
X-Received: by 2002:a2e:be2b:0:b0:2a9:f93c:84cc with SMTP id
 z43-20020a2ebe2b000000b002a9f93c84ccmr1061753ljq.3.1682638557519; 
 Thu, 27 Apr 2023 16:35:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7I5C0Lxp75VY5kEJLNE/yDI8CXn5iJV/ujC1d7hIPLZV48dyrs/leuzK4MECYwLiy2bMsHILw9haftNNOvxc0=
X-Received: by 2002:a2e:be2b:0:b0:2a9:f93c:84cc with SMTP id
 z43-20020a2ebe2b000000b002a9f93c84ccmr1061739ljq.3.1682638557213; Thu, 27 Apr
 2023 16:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
 <D57F9A07-AB77-4FF9-B0A6-C502DC60D093@kernel.org>
 <529e56c85732b0bfcf277de9c651f6c58f47b3b4.camel@redhat.com>
 <CACO55tvJE4UvsAY8yfY7j4gMRkk4kLUPedfL0Sw2B7OF=s-rEw@mail.gmail.com>
 <c548bd562bdd3997ac7fb9287c67c54b56c77c3e.camel@redhat.com>
In-Reply-To: <c548bd562bdd3997ac7fb9287c67c54b56c77c3e.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 28 Apr 2023 01:35:46 +0200
Message-ID: <CACO55tt7sGocRQPVv1vRh4X6Tjcu_C_=abi+C1Z6e2-deOFTCw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
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
 Kees Cook <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, qing.zhao@oracle.com,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 1:27=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> On Fri, 2023-04-28 at 00:50 +0200, Karol Herbst wrote:
> > On Fri, Apr 28, 2023 at 12:46=E2=80=AFAM Lyude Paul <lyude@redhat.com> =
wrote:
> > >
> > > Hey Linus, Kees. Responses below
> > >
> > > On Sun, 2023-04-23 at 13:23 -0700, Kees Cook wrote:
> > > > On April 23, 2023 10:36:24 AM PDT, Linus Torvalds <torvalds@linux-f=
oundation.org> wrote:
> > > > > Kees,
> > > > >  I made the mistake of upgrading my M2 Macbook Air to Fedora-38, =
and
> > > > > in the process I got gcc-13 which is not WERROR-clean because we =
only
> > > > > limited the 'array-bounds' warning to gcc-11 and gcc-12. But gcc-=
13
> > > > > has all the same issues.
> > > > >
> > > > > And I want to be able to do my arm64 builds with WERROR on still.=
..
> > > > >
> > > > > I guess it never made much sense to hope it was going to go away
> > > > > without having a confirmation, so I just changed it to be gcc-11+=
.
> > > >
> > > > Yeah, that's fine. GCC 13 released without having a fix for at leas=
t one (hopefully last) known array-bounds vs jump threading bug:
> > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109071
> > > >
> > > > > And one of them is from you.
> > > > >
> > > > > In particular, commit 4076ea2419cf ("drm/nouveau/disp: Fix
> > > > > nvif_outp_acquire_dp() argument size") cannot possibly be right, =
It
> > > > > changes
> > > > >
> > > > > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> > > > >
> > > > > to
> > > > >
> > > > > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_=
CAP_SIZE],
> > > > >
> > > > > and then does
> > > > >
> > > > >        memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
> > > > >
> > > > > where that 'args.dp.dpcd' is a 16-byte array, and DP_RECEIVER_CAP=
_SIZE is 15.
> > > >
> > > > Yeah, it was an incomplete fix. I sent the other half here, but it =
fell through the cracks:
> > > > https://lore.kernel.org/lkml/20230204184307.never.825-kees@kernel.o=
rg/
> > >
> > > Thanks for bringing this to our attention, yeah this definitely just =
looks
> > > like it got missed somewhere down the line. It looks like Karol respo=
nded
> > > already so I assume the patch is in the pipeline now, but let me know=
 if
> > > there's anything else you need.
> > >
> >
> > uhm, I didn't push anything, but I can push it through drm-misct asap,
> > just wanted to ask if somebody wants to pick a quicker route. But I
> > guess not?
>
> Ah whoops, I misunderstood! Yeah I would say we should just go ahead and =
push
> it since I don't see any indication here that anyone else has.
>

okay, will do so tomorrow then.

> >
> > > >
> > > >
> > > >
> > > > >
> > > >
> > > > > I think it's all entirely harmless from a code generation standpo=
int,
> > > > > because the 15-byte field will be padded out to 16 bytes in the
> > > > > structure that contains it, but it's most definitely buggy.
> > > >
> > > > Right; between this, that GCC 13 wasn't released yet, and I had no =
feedback from NV folks, I didn't chase down landing that fix.
> > > >
> > > > >
> > > > > So that warning does find real cases of wrong code. But when thos=
e
> > > > > real cases are hidden by hundreds of lines of unfixable false
> > > > > positives, we don't have much choice.
> > > >
> > > > Yup, totally agreed. The false positives I've looked at all seem to=
 be similar to the outstanding jump threading bug, so I'm hoping once that =
gets fixed we'll finally have a good signal with that warning enabled. :)
> > > >
> > > > -Kees
> > > >
> > > >
> > >
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> > >
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

