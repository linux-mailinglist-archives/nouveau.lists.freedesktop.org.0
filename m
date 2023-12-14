Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EFC8123E5
	for <lists+nouveau@lfdr.de>; Thu, 14 Dec 2023 01:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6235E10E895;
	Thu, 14 Dec 2023 00:29:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D286210E893
 for <nouveau@lists.freedesktop.org>; Thu, 14 Dec 2023 00:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702513784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oN4Rq76T2MU78KSmZ3OnQmRSJOzHsfBPUD6PRxAotV0=;
 b=GgF/206owCVa3yjb137/oOxXNM3NmA792b+6j7UxnDnI0nJoCpEQ9e+o6vHXqYDg6qjr2K
 OBn/8EJ5GV8ZMxITbo41EJvCH8o44rh3lxRSWXvG8RRJOBCl1pAmR2HQE3hPGc29z0a4Pk
 USpt5Em49+JTBuAHg7i2KzrV9i6NGQY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-ryLQEI58NQagcPdyhvdOUg-1; Wed, 13 Dec 2023 19:29:42 -0500
X-MC-Unique: ryLQEI58NQagcPdyhvdOUg-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-67ef11ee39bso24568086d6.3
 for <nouveau@lists.freedesktop.org>; Wed, 13 Dec 2023 16:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702513782; x=1703118582;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oN4Rq76T2MU78KSmZ3OnQmRSJOzHsfBPUD6PRxAotV0=;
 b=h+y1YnWs1euXWpZRo6d0JCZiuTz25M2V0C4qXStg61cpttXBcMuiWntBpDGSG9dWHH
 jKaZt88rqRvBRBDhwIJ8kI2n8lu6dFHWW5BkyzaYC5sIsU6elc5UIHMhWQIYFZfy9BnX
 7b2C55v6gxehRdBm9QIveWCrW2xBvrs+V6BK6wQ+WkluE4GXOk41g87qsKQ33MkL3Uz2
 eb3q4eTAZYOnyY+YQGADNj46yOQfJR9Tpo9TG0YpucgWTJ6TyYxpC0ObM/Ng33go31wf
 T6cXJUOzcYcrFbbTizZ2oBUxuo3RPmBIPui07HM/SVBAUzolE2v/gTamc+6WZKPXQoDo
 YL2A==
X-Gm-Message-State: AOJu0YwdBC4zdaQ1O6YSvw3fSyT3SSHNnpR8i/Bd0sF+iRAZfAOvh58W
 dgj1zeqrDZlS8NlQkpEX1wBcRGkeia7VPT5C3ZhhozJniZPsz1hjik3+Kz20alK1NLfa901n7OZ
 phuvPfNzuNkEGWp0jv4uHkR6UeA==
X-Received: by 2002:a0c:c302:0:b0:67e:f0c6:f63c with SMTP id
 f2-20020a0cc302000000b0067ef0c6f63cmr3127421qvi.73.1702513782082; 
 Wed, 13 Dec 2023 16:29:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT8NAo/e6k3ZstcJUfz2WKPCzwDFukF/FeEkwM1oBWivWpyuN2Q5+EAT9+mBMJfs08TgmRBQ==
X-Received: by 2002:a0c:c302:0:b0:67e:f0c6:f63c with SMTP id
 f2-20020a0cc302000000b0067ef0c6f63cmr3127411qvi.73.1702513781828; 
 Wed, 13 Dec 2023 16:29:41 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 qh10-20020a05620a668a00b0076cbcf8ad3bsm4853219qkn.55.2023.12.13.16.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 16:29:41 -0800 (PST)
Message-ID: <f1a33f9001bc642fd71280559ec0f612936db2a8.camel@redhat.com>
Subject: Re: nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
From: Lyude Paul <lyude@redhat.com>
To: Borislav Petkov <bp@alien8.de>, Paul Dufresne <dufresnep@zoho.com>, 
 Danilo Krummrich <me@dakr.org>
Date: Wed, 13 Dec 2023 19:29:40 -0500
In-Reply-To: <f10791773520f85857749c080af999821dd41a0d.camel@redhat.com>
References: <20231111120323.GAZU9tiw8e0RSzCGB9@fat_crate.local>
 <20231212224037.GAZXjhZUDeoq50xKJ5@fat_crate.local>
 <18c613ec092.ae61cf7d6029.4389632938517239705@zoho.com>
 <20231213113936.GBZXmX+MKqX/qOnPn1@fat_crate.local>
 <20231213124936.GCZXmoYDq8nMRs75XM@fat_crate.local>
 <114bf9f5790f637a6cdec4957244192d3bd76a04.camel@redhat.com>
 <f10791773520f85857749c080af999821dd41a0d.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel@ffwll.ch>, nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Nevermind - I don't think I'll need the logs, I stared at the code for long
enough and I think I realized what's happening.

I will have a patch for you to test in just a moment, just waiting for it t=
o
compile so I can verify nothing else breaks

On Wed, 2023-12-13 at 18:48 -0500, Lyude Paul wrote:
> Hopefully you're still on at this point - if you are, could you try start=
ing
> the machine up with the following kernel module arguments passed to nouve=
au?
>=20
> debug=3Ddisp=3Dtrace
>=20
> Then see if you can find any lines that mention INHERIT? I have a feeling=
 I'm
> just going to have to add a workaround for the time being, but I'd really=
 love
> to know how we're managing to get that far on a hardware generation we ne=
ver
> implemented that nvkm ioctl for=E2=80=A6
>=20
> On Wed, 2023-12-13 at 18:37 -0500, Lyude Paul wrote:
> > agh - thank you for repeatedly poking on this, I've been busy enough wi=
th GSP
> > work I totally missed this. Yes - I'm quite surprised that this is blow=
ing up,
> > but considering that looks to be a GT218 I guess display state readback=
 must
> > just work a bit differently there since that's really early on into the=
 NV50
> > days.
> >=20
> > The reason that was a drm_WARN_ON() was because it indicates that we're=
 not
> > reading back OR -> head assignments properly. But, I'm confused how we'=
re even
> > getting that far on a non-GSP platform. I'm going to dig into this now,=
 but if
> > I don't figure out a good fix by the end of the day I'll just send a pa=
tch to
> > silent the warning.
> >=20
> > Thanks again for bugging me about this!
> >=20
> > On Wed, 2023-12-13 at 13:49 +0100, Borislav Petkov wrote:
> > > On Wed, Dec 13, 2023 at 12:39:36PM +0100, Borislav Petkov wrote:
> > > > We're getting close to releasing so I guess we either debug this or=
 shut
> > > > up the WARN.
> > >=20
> > > Not only that - panic_on_warn turns this into an explosion so you don=
't
> > > want that in a released kernel.
> > >=20
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

