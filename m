Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22625955BFF
	for <lists+nouveau@lfdr.de>; Sun, 18 Aug 2024 10:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AE010E16E;
	Sun, 18 Aug 2024 08:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Px0anN5P";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B387710E118
 for <nouveau@lists.freedesktop.org>; Sun, 18 Aug 2024 08:52:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso40803491fa.3
 for <nouveau@lists.freedesktop.org>; Sun, 18 Aug 2024 01:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723971127; x=1724575927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaXM8tMajoENaQZObqdr4u+7t4wGj6GAMOQWM7gRwcQ=;
 b=Px0anN5PKR7n9NUToObL/CqlTaNj8EDQwcZbIvdm3ctrT6DmDW87OC3J/9ZZaZ363L
 uH3lXoAHWShZqZ7XYQDwzDRwmQ/M2BYyeAlj/bgFsZW9j7ErEKjj4kNmVNcCSRrfHIIx
 gjKuUOJWnHb6wHvs2ageGJySr1UzsQwyQwP/pSEtBxWWM72cy/dGVRw0uTYxHsnc7y/X
 xCKl2ammZ5ej73ZK1SlyW/1dFD8As/ELvWfRlUKdPHvOXsVHVAgLjn+nK1EKchuAVjJK
 fffA9IFDh5dgGIydpG3dXsizg286kgYwZsM1CG+Fn29wpqBngqCjHj1+8gaqWGo2GBn4
 Ho6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723971127; x=1724575927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaXM8tMajoENaQZObqdr4u+7t4wGj6GAMOQWM7gRwcQ=;
 b=HSxfJsa/I9mqcsz3tAZ3SS2jPfgPimDV6M/LlGcrYDtfO3eOS5NTO43aujtX7qh4Ac
 Jgyql+6TjmHPIGZcxtYm0Tgcy+H2ixcRODVna0OD9q0BJYieC2QGHTwplBJ9ibgzEO42
 HcV+UOTBxrxZ1CbKtQeRnNdsSF7Xg9giVB+Ab9maJACIWwS7nVtsGH9lCWOM3KS17z2i
 hDNyKsSHyJW5hWYH+R24agJLd7FKY2HxRA2XeoqARGdKHTOKS1MZYM5hJHnCma+8eks9
 9zmnXNh1RT+Fh4PiQwAbOel2GewvPVwpO6WkOSJ1SR1LF+z2kZWM0r5v/2UeVcm68MG9
 Lg1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPb6QkFhymk6bGTAZevR7LakJMLrtqLzHe71GA9rsMOvX+uuBzYSYrLIRiwB5+dvzwY6Mwmjuk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiiPieBsyfdJpkKTgKTLOHmey2hul6hrVxtT9N4EiTewQw3O4P
 2IP3x9ANXNJXQoA6/EHOwJ5GYd5E5uEytpIoUrNboz6j7pO2Z573tZIgwKi9LaLbohrombdABu9
 8tkLfEHjG8tInv1HVJ5KtKD1LkWEEd0w2IMzZJw==
X-Google-Smtp-Source: AGHT+IFJBYUL4v23WKAddpRvtFX0zdPnk+dC7WJ66AsuREM0rgiVjFfkgvfqTjZKnZNVPt7mnctS4eUYkkKWTbTHLuc=
X-Received: by 2002:a05:6512:a8d:b0:52e:fa5f:b6b1 with SMTP id
 2adb3069b0e04-5331c6f46c2mr4360089e87.60.1723971126975; Sun, 18 Aug 2024
 01:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-26-tzimmermann@suse.de>
In-Reply-To: <20240816125408.310253-26-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 18 Aug 2024 10:51:56 +0200
Message-ID: <CACRpkdYBoz8s6_So00Y8=203Sf+wyQCvF89KXFTdgD7HuYeeyA@mail.gmail.com>
Subject: Re: [PATCH 25/86] drm/mcde: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
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

On Fri, Aug 16, 2024 at 2:54=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The mcde driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
