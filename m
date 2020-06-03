Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B01ED39B
	for <lists+nouveau@lfdr.de>; Wed,  3 Jun 2020 17:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CCD89895;
	Wed,  3 Jun 2020 15:42:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6277289895;
 Wed,  3 Jun 2020 15:42:58 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id g129so1668794vsc.4;
 Wed, 03 Jun 2020 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+v4mUPWrEgtC6NRHUyR/xEDnM6YAcz7lXyI+WN23E04=;
 b=khLffvfzVOTkhZTg4LH+qEdUt73iWPRnL9GaoDNme5UbPkDVXCY5TqrzYGvhtcIoga
 cKEaaSukhEUrbDyPveKQNibicwL0vJI1sqkVdxs+iz+nSTyId8VO4WYcHwUJu5wOeIi/
 c8UVYg5uRcelc59CHgFsp5wPS5Q4t3aG+dXUOm+3JKQc8ZGIcJo8eQdYnFtyvqSvpMEc
 meiMqZLRqBZt5tPR/mAcgTkKvrNnL5gDlBwx4LvepacSHca14xeZxhAEHEdGCnw9Qc55
 +RLa6I2bbLDEWBZwsIct44sDCTTKbj2jrpCrRX4C1mOSEsPSDJUbuZV5LROQ/IcLK7Om
 Sp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+v4mUPWrEgtC6NRHUyR/xEDnM6YAcz7lXyI+WN23E04=;
 b=BvoIIVmLfzuFRJfYnjV+J8JQqO9A47VABYC3itwsvjTmsuF16z+h/OhN8ohStog+6F
 Iah5TkSHsTvgwwOr3qOoDuOfMm7Ixvlxymsii7uNrtskYrmRmCRRMIiknjyHe0iNF8sM
 fqIJbUGogfAXIilEcrCTsWa4TgVGEtYEuz3482S5cdR/OWVjM6uniz86d1jPzhH4M+xr
 /jGq7KcD72qWnbnDKEcZgYKbcvrdEk32krg2dC1BbQ29IyjjcnghY5yCL+nFTyV5lLfg
 OUil78tXiANQkBPlcffc771m+DKofbPZn+qG91zxZSuS9nTqCIX4xFqTOec4u6uoFuqI
 X3rQ==
X-Gm-Message-State: AOAM53158Zuue3W8NwLQIuW38CccK3nZyeqL85C8VKcerej8kphkaj+h
 J471Z9BQi6sUEe503MRmK/IS6FB4Kg700cc/z3E=
X-Google-Smtp-Source: ABdhPJw5n02lpBHKugUxtKm8DveNj4ZSMg6h12mYs3x3BR4r2dCSxt3GQS8NEU5HWJZuWnL499Nz8JoOwcgIKa+ySt4=
X-Received: by 2002:a05:6102:22ec:: with SMTP id
 b12mr18862vsh.138.1591198977515; 
 Wed, 03 Jun 2020 08:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200603142002.3776672-1-thierry.reding@gmail.com>
In-Reply-To: <20200603142002.3776672-1-thierry.reding@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Jun 2020 16:39:37 +0100
Message-ID: <CACvgo529m+fub=ZddGkjRXEY-7i3rRUs0EssYGf+DJgkcDm3Zg@mail.gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: gr/gk20a: Use firmware version 0
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
Cc: linux-tegra@vger.kernel.org, ML nouveau <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 3 Jun 2020 at 15:20, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Tegra firmware doesn't actually use any version numbers and passing -1
> causes the existing firmware binaries not to be found. Use version 0 to
> find the correct files.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Fixes: ef16dc278ec2 ("drm/nouveau/gr/gf100-: select implementation
based on available FW")
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
