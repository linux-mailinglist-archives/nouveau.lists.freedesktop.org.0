Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91FD48CF82
	for <lists+nouveau@lfdr.de>; Thu, 13 Jan 2022 01:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3F410E5F3;
	Thu, 13 Jan 2022 00:03:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D1910EA1E
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jan 2022 10:21:37 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id y10so5653696qtw.1
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jan 2022 02:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYa1AOMbwuEU5EoeFlC3BWCMkWWYeKQ6MzYHnQnQ7eE=;
 b=ADWJF9NlN1riYAttU3zhO5neGE8WbLaCIvok+V9lSGE0piCV0prLf7+bn5z3SMJ+K2
 IHjlTQb93qCePszMBjx5pEpzCajoEv+8wY/FNe7qfccpCPzTFxdbklOP+qumxiq3L1VW
 uvvuDmP/W53sjpnR37YNLy9ZrfEewxiMn66a6GIGHegB21ctGhTK2tDmxwbGvnmSw9/v
 8alfe6uTMOwU9BspizOMNMgQf2OJTzu3cSUTcyfUoMNWfA1+iF3KtNcaFy7lt9GhxsvP
 0j9w3a1jnioAk8FlLcANFsacbWLO6Rmskg7IDKIptjcHfyUiLwVI0B+zdeGDR7Qjk+8b
 poWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYa1AOMbwuEU5EoeFlC3BWCMkWWYeKQ6MzYHnQnQ7eE=;
 b=5TTrctHpzvls36VR31bPcpUh9XNnyqNWMXfXuf2BDm5X57B2K1XrIkLKPmDzIJQHtR
 W5EOG8q8cI0qk1Pibl62dPZe2igfWLQtpl6gbY+hSNZcRO7dkC9c5u0Ra9i7F/1fAYyS
 gVE7rGPW3vjRrBOL6X1b0i8WunZobYL4RYaYOKcY6fPiugcoU7cW17cym6j/x/hztXKV
 7JrsVmCXjN6qsrfS5BtJEdh5Lhi5c6lBgsu7Y1f7bgLW+lxnJfU7ZSVHlfruL0LzCMKk
 2uL6tXpXSGVKnEvIpSBE2/qOWthZDL9eplblg+ynK/slV2caADj2+ZTNpiZLWapqc1ls
 vJHA==
X-Gm-Message-State: AOAM530nmELK0f/u/LdpxmYwH+CiyHdvxGH9ma/lGuug8M1BU+Le2ol/
 Z1aGJj7lPK7vRkdPmrkGDEDkSzVOyuRNQJuUp8ZWkA==
X-Google-Smtp-Source: ABdhPJzbbUNfgyjXmi4t4BA1QOJPl5KiyFfbLF2N8k+Y03nyY+75s+ZulSA2IoVUQkNdry1B9vDzlMJWaMglFWDoSCo=
X-Received: by 2002:a05:622a:5d2:: with SMTP id
 d18mr3059764qtb.154.1641896496162; 
 Tue, 11 Jan 2022 02:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20211215104318.18866-1-tzimmermann@suse.de>
 <20211215104318.18866-4-tzimmermann@suse.de>
 <87pmpy3za7.fsf@intel.com> <2165cfb8-c9c6-1aca-b492-587a8e07eb9f@suse.de>
In-Reply-To: <2165cfb8-c9c6-1aca-b492-587a8e07eb9f@suse.de>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Tue, 11 Jan 2022 11:21:25 +0100
Message-ID: <CABxcv=nnyfULvog9z=nMduDK0iT1ZwkxYhdKs3xW88St6C00pw@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 13 Jan 2022 00:03:11 +0000
Subject: Re: [Nouveau] [PATCH v2 3/5] drm/dp: Move DisplayPort helpers into
 separate helper module
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 12:12 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 15.12.21 um 12:04 schrieb Jani Nikula:
> > On Wed, 15 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>      * move DP helper code into dp/ (Jani)
> >
> > I suggested adding the subdirectory, but I'm going to bikeshed the name,
> > which I didn't suggest.
> >
> > $ find drivers/gpu/drm -mindepth 1 -maxdepth 1 -type d | wc -l
> > 68
> >
> > Assuming we move more of the drm modules to subdirectories, how are they
> > going to stand out from drivers?
> >
> > I suggested drm_dp, which I understand results in tautology, but hey,
> > all the filenames under drm/ also have drm_*.[ch]. And I find that very
> > useful for git greps and other code archeology. With just the dp name,
> > you'd have to know and list all the drm subdirectories when looking up
> > stuff that's part of drm but not drivers.
>
> I think we have enough filename prefixes already. drm/drm_dp/drm_dp_ is
> just ridiculous.
>

Maybe what can be done is to just add a drivers/gpu/drm/core
subdirectory that would contain all the DRM core code ?

Then the dp helpers could be moved to drivers/gpu/drm/core/dp/drm_dp.c
for example. This would also make easy to differentiate the drm
modules from the drivers with just:

$ find drivers/gpu/drm -mindepth 1 -maxdepth 1 -type d -not -name core

Best regards,
Javier
