Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B2F6F0EDB
	for <lists+nouveau@lfdr.de>; Fri, 28 Apr 2023 01:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9781610E19D;
	Thu, 27 Apr 2023 23:27:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED26710E1F8
 for <nouveau@lists.freedesktop.org>; Thu, 27 Apr 2023 23:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682638020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YUCmvsqJPS8iPKOBONidgoWQBmu7QGqu7UvLPOsPhU=;
 b=MThz6+ACPboPXo24j0DV0m69T85KcJlXMts2G7DnXJERd34HQ5eP2GS59Sg/FclcxhlXyU
 lkvaiygYcy1WlYjk0XVVkt0/gsImmEFUTioZkhtw8QdyX4djQudvYJqBlRzYjUI1CNwqs1
 s19pFjJcI6+uKFmsGHmcNZojFdmFdus=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-CHGTDcS5NJSm-ZLb63hUMw-1; Thu, 27 Apr 2023 19:26:59 -0400
X-MC-Unique: CHGTDcS5NJSm-ZLb63hUMw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3f0a65d5a1dso63855511cf.2
 for <nouveau@lists.freedesktop.org>; Thu, 27 Apr 2023 16:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682638019; x=1685230019;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7YUCmvsqJPS8iPKOBONidgoWQBmu7QGqu7UvLPOsPhU=;
 b=D6N5FnXb+xUHRsN1rR6JP8PJuQL0PypQZzbp1sfAYXrCa70YcdHedUP0MRCzCoNaNb
 xJqkg1I9w4LoelIAsvY9y4inwNkm+5Ee2+JdqA7VCQT6Z/0yw4vjlQLkGvJDnfE7eMPr
 vXPoqwI60ljJ8bA5FJZLLTgdZJgAmDP4+9KGSzKTsU7CzsQf6+JQBLmYndSq7eDaW49c
 9ZKTvET6VsAlDhcaKutC/xKkKSmFdWtDj9hXAWJGZL7GS7tS99MH06cruPKd5USi+hXM
 fOmv1iVaTtKAyw2qm3DHZmhnn3rD+ILNGL5JZaaHgzfXAA+7oPfO/xzqzJX3JQE1DULb
 nucA==
X-Gm-Message-State: AC+VfDwT73Z/e21ALro7YGblrMZy0Zn106RIaDqE2C+BWQ0u1r5GI/kX
 8DbfW36n3ZybRI8MqbWX+HVO0ACMdRV57LgxjzmGdVE7V8pAMdY77KFUT592vje0ptUttK8eNUt
 5NdkylO3VnDrzj7FKa+4mVnZTpA==
X-Received: by 2002:a05:622a:1d6:b0:3ef:46b0:80e8 with SMTP id
 t22-20020a05622a01d600b003ef46b080e8mr6713106qtw.19.1682638019353; 
 Thu, 27 Apr 2023 16:26:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4WLY7MePNrZIMMUsjK6UA+mjTyZg+eBttohWOgYZkEa+fkOutQzPaWakLg3ihFe55dfWFwlw==
X-Received: by 2002:a05:622a:1d6:b0:3ef:46b0:80e8 with SMTP id
 t22-20020a05622a01d600b003ef46b080e8mr6713082qtw.19.1682638019080; 
 Thu, 27 Apr 2023 16:26:59 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 cd15-20020a05622a418f00b003f1f26bbb50sm1131053qtb.35.2023.04.27.16.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 16:26:58 -0700 (PDT)
Message-ID: <c548bd562bdd3997ac7fb9287c67c54b56c77c3e.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Date: Thu, 27 Apr 2023 19:26:57 -0400
In-Reply-To: <CACO55tvJE4UvsAY8yfY7j4gMRkk4kLUPedfL0Sw2B7OF=s-rEw@mail.gmail.com>
References: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
 <D57F9A07-AB77-4FF9-B0A6-C502DC60D093@kernel.org>
 <529e56c85732b0bfcf277de9c651f6c58f47b3b4.camel@redhat.com>
 <CACO55tvJE4UvsAY8yfY7j4gMRkk4kLUPedfL0Sw2B7OF=s-rEw@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
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

On Fri, 2023-04-28 at 00:50 +0200, Karol Herbst wrote:
> On Fri, Apr 28, 2023 at 12:46=E2=80=AFAM Lyude Paul <lyude@redhat.com> wr=
ote:
> >=20
> > Hey Linus, Kees. Responses below
> >=20
> > On Sun, 2023-04-23 at 13:23 -0700, Kees Cook wrote:
> > > On April 23, 2023 10:36:24 AM PDT, Linus Torvalds <torvalds@linux-fou=
ndation.org> wrote:
> > > > Kees,
> > > >  I made the mistake of upgrading my M2 Macbook Air to Fedora-38, an=
d
> > > > in the process I got gcc-13 which is not WERROR-clean because we on=
ly
> > > > limited the 'array-bounds' warning to gcc-11 and gcc-12. But gcc-13
> > > > has all the same issues.
> > > >=20
> > > > And I want to be able to do my arm64 builds with WERROR on still...
> > > >=20
> > > > I guess it never made much sense to hope it was going to go away
> > > > without having a confirmation, so I just changed it to be gcc-11+.
> > >=20
> > > Yeah, that's fine. GCC 13 released without having a fix for at least =
one (hopefully last) known array-bounds vs jump threading bug:
> > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109071
> > >=20
> > > > And one of them is from you.
> > > >=20
> > > > In particular, commit 4076ea2419cf ("drm/nouveau/disp: Fix
> > > > nvif_outp_acquire_dp() argument size") cannot possibly be right, It
> > > > changes
> > > >=20
> > > > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> > > >=20
> > > > to
> > > >=20
> > > > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CA=
P_SIZE],
> > > >=20
> > > > and then does
> > > >=20
> > > >        memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
> > > >=20
> > > > where that 'args.dp.dpcd' is a 16-byte array, and DP_RECEIVER_CAP_S=
IZE is 15.
> > >=20
> > > Yeah, it was an incomplete fix. I sent the other half here, but it fe=
ll through the cracks:
> > > https://lore.kernel.org/lkml/20230204184307.never.825-kees@kernel.org=
/
> >=20
> > Thanks for bringing this to our attention, yeah this definitely just lo=
oks
> > like it got missed somewhere down the line. It looks like Karol respond=
ed
> > already so I assume the patch is in the pipeline now, but let me know i=
f
> > there's anything else you need.
> >=20
>=20
> uhm, I didn't push anything, but I can push it through drm-misct asap,
> just wanted to ask if somebody wants to pick a quicker route. But I
> guess not?

Ah whoops, I misunderstood! Yeah I would say we should just go ahead and pu=
sh
it since I don't see any indication here that anyone else has.

>=20
> > >=20
> > >=20
> > >=20
> > > >=20
> > >=20
> > > > I think it's all entirely harmless from a code generation standpoin=
t,
> > > > because the 15-byte field will be padded out to 16 bytes in the
> > > > structure that contains it, but it's most definitely buggy.
> > >=20
> > > Right; between this, that GCC 13 wasn't released yet, and I had no fe=
edback from NV folks, I didn't chase down landing that fix.
> > >=20
> > > >=20
> > > > So that warning does find real cases of wrong code. But when those
> > > > real cases are hidden by hundreds of lines of unfixable false
> > > > positives, we don't have much choice.
> > >=20
> > > Yup, totally agreed. The false positives I've looked at all seem to b=
e similar to the outstanding jump threading bug, so I'm hoping once that ge=
ts fixed we'll finally have a good signal with that warning enabled. :)
> > >=20
> > > -Kees
> > >=20
> > >=20
> >=20
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

