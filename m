Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188E90C5D7
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2024 12:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464DF10E18E;
	Tue, 18 Jun 2024 10:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b1Opb+E4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A4010E616
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 10:07:45 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso5818168276.0
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718705265; x=1719310065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCx7fOAnUmTX/Xe4ctYyfLYc6JY69uTQO3mrnLIZgkE=;
 b=b1Opb+E4Vu4Y4JgedY8yk3C7uuGBpuruiw4gS55pkz/n+JOpTE29XlBNM2Apn6RW42
 zQqn9YIi2o9BRp4YisEkcrFQ2NGY/ruEQcPb8rdEWL2N79BF72ban/YduAmkerloUH7A
 82JSAOk2s79HlClSolE8zI1KAP0n1qtQwaBH0f58LghjUjTzc3IsO3KgA1v2UTVaxWWR
 hlup8ejy6Vxb5KxpzrlLj8M3ih9wayiXPywXOQAAxez8bYyxeDQB6xN4Kqo+f+pYnCOW
 NQ0nmMdLO2otnQPvl/i88ya4U9UR0ESf+3oA0Bijx3AtDm2+oRfLj70Mn5KhckLMgvxU
 DMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718705265; x=1719310065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCx7fOAnUmTX/Xe4ctYyfLYc6JY69uTQO3mrnLIZgkE=;
 b=NpIq7DwAIN7P1qhdpnEnzMFsfWrQ1gWax9WUZK+kv5KTY3RFWqA5aZ3+8zjgUtsJLv
 5t0chTmgZCFRUD+E1jpwk0dBEcKfkSj6dmI22la7VrPNhaHVyB7hgiek7e01eMkZRuNX
 SXRNjWnMNgzOYip8EYCbsw8MVyIU0emSwCnykRxCWp/kTBfkBzTPCdgaLyV1zIWCF8B5
 oXXT1hOmAkNwoM17gRrZ1DwB/P3MaAcoPEvbO+PcqgHn6nAYjwPQp7wVvc1Ic+r7xlhr
 RKMBuVJYEoiBJj/3BkZNrKNzSJMNlA2ErpGS89Lyo6OEeSzKA8YPUiZiUW16RJMEJljB
 4ySg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdDIAiHtcV+AvRXYRyJbuUcJvrDmwqNyxKOPbFLfBUxFpyB+sQJId+h3me2/BgaE5sAsS5lXhxXG47Gy0YfeAHQgvDejw79J1hJfveRg==
X-Gm-Message-State: AOJu0YwOc6oPyRJ2UccJ2/sO7ujAlDOgtCwMMyCQhB/5u21+3uBX7jeh
 i9iqrPEqYKpXXb3LLgGal49NdmwL9b4oXyI4kxUuNmAguO09fnvENckRQfd4+k1mKzDmcNgeer7
 IW8hH3o/RyuaV22poCMug5s/oC/9AFv/ichMr3A==
X-Google-Smtp-Source: AGHT+IFJ0kiksoEZDocVzYOcTdne8U7N6C+jsZexpeus6Jap6pxdsUb8A3nFZ7pup6bdeGO4XrwkK9/1Lawl6Ll+PGk=
X-Received: by 2002:a25:abe1:0:b0:de4:828:b73c with SMTP id
 3f1490d57ef6-dff154d21d2mr9969203276.54.1718705264631; Tue, 18 Jun 2024
 03:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240618030024.500532-1-andrealmeid@igalia.com>
 <20240618030024.500532-3-andrealmeid@igalia.com> <878qz2h9pp.fsf@intel.com>
In-Reply-To: <878qz2h9pp.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 18 Jun 2024 13:07:33 +0300
Message-ID: <CAA8EJpqM4iaG3PKM5c0Op7Y7c1SRDrOCk_oOnwG8YfdCxC8w6g@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] drm: Support per-plane async flip configuration
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Simon Ser <contact@emersion.fr>, 
 Pekka Paalanen <ppaalanen@gmail.com>, daniel@ffwll.ch,
 Daniel Stone <daniel@fooishbar.org>, 
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>, 
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com, 
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 18 Jun 2024 at 12:38, Jani Nikula <jani.nikula@linux.intel.com> wro=
te:
>
> On Tue, 18 Jun 2024, Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> > Drivers have different capabilities on what plane types they can or
> > cannot perform async flips. Create a plane::async_flip field so each
> > driver can choose which planes they allow doing async flips.
> >
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > ---
> >  include/drm/drm_plane.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > index 9507542121fa..0bebc72af5c3 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -786,6 +786,11 @@ struct drm_plane {
> >        * @kmsg_panic: Used to register a panic notifier for this plane
> >        */
> >       struct kmsg_dumper kmsg_panic;
> > +
> > +     /**
> > +      * @async_flip: indicates if a plane can do async flips
> > +      */
>
> When is it okay to set or change the value of this member?
>
> If you don't document it, people will find creative uses for this.

Maybe it's better to have a callback instead of a static field? This
way it becomes clear that it's only relevant at the time of the
atomic_check().

> > +     bool async_flip;
> >  };
> >
> >  #define obj_to_plane(x) container_of(x, struct drm_plane, base)
>
> --
> Jani Nikula, Intel



--=20
With best wishes
Dmitry
