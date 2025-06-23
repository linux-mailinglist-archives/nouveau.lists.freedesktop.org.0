Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5157AE4CEE
	for <lists+nouveau@lfdr.de>; Mon, 23 Jun 2025 20:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B89A10E183;
	Mon, 23 Jun 2025 18:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="gTb3cmMZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CEE10E183
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 18:41:41 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ad89ee255easo821184266b.3
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 11:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750704100;
 x=1751308900; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6wfyODG1jwRC8vNYdWS88MDPTcLAGOx2PQYgDgy4ysg=;
 b=gTb3cmMZsSY4t8O2Rh1gyZC8d6SEs+J48G8/561ie2qcFtoMHbDYLejWk4by9fz9Ve
 saJrp8qT6svfrFNG1RBBaa6ItTfaJf8dDThR2ZohxpLOoKKuHgzjbY5VT2IaiHEtj1VA
 K6ekrwne9KQ+DYQPSGlOGcfhSdUHSl+0+Z15vAws7T5zUZFNZiVjBFcjmM6LS6JpIthq
 Ba6jr+EFR9ocx55hn15vGiZolsaJjlHAIxPiKKzPmSQQ3mu6Nc9roRKIvZMHflZdDAMJ
 msUimnPqL0Te8ZT2yWWc/FElTnyQIMCrpluCzfuGQSUvXg69WwKTBnWLtMJ4Pnze63v9
 PM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750704100; x=1751308900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6wfyODG1jwRC8vNYdWS88MDPTcLAGOx2PQYgDgy4ysg=;
 b=AO57l3oSiddF+gHy2yPHWChVm6EMSDHCovloTD0KyfupODP8RVIzDRCbA1m39+8hVT
 hq2x6o28qGXk8OXKcm4Adthkj/TtbzOqWUibSoPFqjMy6mBe7566tub9Fh2OT8h80Z8U
 K1GGxm+pk05d1fdUoPXe0M82d/qNMoX+Yhc9EK+cw9VEITfZ+0RZwsDinJwB8lMSIsXs
 gaWWbf5gDJ5CIhsA+KdiuqtHS5D0PpCYtvSVcWbuGUgH2/g2O24+eTIBitTTd5ajhHNZ
 tooR60MFtJZB9/M8oZGXT6usH6aOmCtnTXEvXxmhFoMV6k4dbcZpKxJh7C9yzh8lTtpn
 G5yA==
X-Gm-Message-State: AOJu0YwrtVtqQ0O7xk/Ct3p4N9SZbFS7eYdZecxRiINNvR+GwVBIw8gx
 zt4yszIbIRJ3obiw9Zf4IyL0t/RBaE2sLz6Drw8W9L/RhDIKEVIeFaSUTOAGfwEkq2NzGXToeij
 4gu5QLQCqpDsjbaMRaD8Ql3wOG9Iv7c+ZqL4XjaK5Wg==
X-Gm-Gg: ASbGncsn88QMNMpJjUkzVHUa9zYE54ePk/ia5KbVlT0ZCJXCMrMBoNvfJca5HZglBwb
 5C8siCH7GuvMOzxyjNqBdz7l4dvL3oprdAKnYgb6V36HPBmCLRnP05G8uoio6zZQ2cDr6sR4VJ4
 bVHkgTeJnAZwWqF1MQ6X2RxA+J5YtDeKleP4TYxzc5yA==
X-Google-Smtp-Source: AGHT+IHKPynJavztV3usU6Y20MldPZsnTFVvkROGoTW1yQaQsHXnihpfkZh9OCYlyUmNgXC+L5uG5+EwTcHeRWf2c3A=
X-Received: by 2002:a17:907:7243:b0:ad4:d9b2:6ee4 with SMTP id
 a640c23a62f3a-ae057f662e8mr1321447166b.49.1750704099639; Mon, 23 Jun 2025
 11:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAAgWFh2wsJ3H0+Wa5=t7T7uJmnf8Zh49r==h3hbN650buSHEmQ@mail.gmail.com>
 <5a742cb7-1b06-4e84-8de1-9dbe03f99250@nvidia.com>
 <20e965c8a3021f052b15ad4d1626b811391b96be.camel@nvidia.com>
In-Reply-To: <20e965c8a3021f052b15ad4d1626b811391b96be.camel@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 23 Jun 2025 14:41:13 -0400
X-Gm-Features: AX0GCFuTFTT5Y_TpL52n7w0so2iJiloDJSL9anLyX7dtIzJkxaSee0Zc0KRbDqs
Message-ID: <CAAgWFh0kQueNXZbVOKFCA2L0AX9PoXvvjPu=yOaXphCYPD02cw@mail.gmail.com>
Subject: Re: Set DRM_NOUVEAU_GSP_DEFAULT to default y ?
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>, 
 "kherbst@redhat.com" <kherbst@redhat.com>,
 "lyude@redhat.com" <lyude@redhat.com>, 
 "dakr@kernel.org" <dakr@kernel.org>, 
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Content-Type: multipart/alternative; boundary="000000000000f762a50638418fed"
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

--000000000000f762a50638418fed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, that makes sense to me. I'll put together a patch.

On Tue, Jun 17, 2025 at 12:31=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrot=
e:

> On Tue, 2025-06-17 at 14:09 +1000, Ben Skeggs wrote:
> > I have no objection to this.  Initially, the primary reason for keeping
> > it disabled was to give some time to shake out any regressions - but I
> > think we're well past that point now.
>
> In that case, why not just simply remove the Kconfig and have Nouveau use
> GSP if it finds it?  I
> believe it automatically falls back to non-GSP if the firmware images are
> missing, anyway.
>
> If the CONFIG option is set, is there a way to force non-GSP via the
> Nouveau command line?
>

--000000000000f762a50638418fed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure, that makes sense to me. I&#39;ll put together a patc=
h.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 17, 2025 at 12:31=E2=80=AFPM Timur Tabi=
 &lt;<a href=3D"mailto:ttabi@nvidia.com">ttabi@nvidia.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2025-06-17=
 at 14:09 +1000, Ben Skeggs wrote:<br>
&gt; I have no objection to this.=C2=A0 Initially, the primary reason for k=
eeping <br>
&gt; it disabled was to give some time to shake out any regressions - but I=
 <br>
&gt; think we&#39;re well past that point now.<br>
<br>
In that case, why not just simply remove the Kconfig and have Nouveau use G=
SP if it finds it?=C2=A0 I<br>
believe it automatically falls back to non-GSP if the firmware images are m=
issing, anyway.<br>
<br>
If the CONFIG option is set, is there a way to force non-GSP via the Nouvea=
u command line?<br>
</blockquote></div>

--000000000000f762a50638418fed--
