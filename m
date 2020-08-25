Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF0251D7D
	for <lists+nouveau@lfdr.de>; Tue, 25 Aug 2020 18:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E388915A;
	Tue, 25 Aug 2020 16:52:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9E98915A
 for <nouveau@lists.freedesktop.org>; Tue, 25 Aug 2020 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598374333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GH3XQPFWbt0lqGRNQZepy/lyen7L04oI1NtwwdbRf3c=;
 b=NrXlumnecMEHxwDwn5rsp9Ui8UGR+Qz/VL2uyOKCAPTxCpKnAktJCLNa1uYWTACXU3Cjfj
 FBIDQwDatcXhkFtRYfHFf/YAQH9fL3gDrD1OXX5mvuj9YPG63R1ZZVap1pwtBkTESFYwh9
 YeE1CgnRV9XeAAEUX90m4d1rvGbqRIc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-DqAXLkDlPWiE3z8yBwlk8Q-1; Tue, 25 Aug 2020 12:52:07 -0400
X-MC-Unique: DqAXLkDlPWiE3z8yBwlk8Q-1
Received: by mail-qt1-f198.google.com with SMTP id w30so9800097qte.14
 for <nouveau@lists.freedesktop.org>; Tue, 25 Aug 2020 09:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=GH3XQPFWbt0lqGRNQZepy/lyen7L04oI1NtwwdbRf3c=;
 b=dLdcFJTB0LuvGFiTWsnvwnYfdB0WNS1+Hw5K5EBRfKrOr47AJJuoM3or3BUzAoaegO
 JI9k4jp5pd4LTEoI29YCo7MwHVqa3tctWsyDXgF2g/pKTHzlTT2tU+m2Tw8j0k8+LwDs
 a1Fws1S5XIGFkZWdAL5d+QvE8DbVZ7+bps3JoAN7P1PsHcHyXlzsdgdVGOczFL4Q6YJL
 1nBOjcKo6YF9j0QQaRtt1/u0N4w60MYZN9Fo/rE356PXtqjBWMPsEtUadrzzsfCiZ53m
 BUxYEj4KPuywd5clbcY7KS5DdvF3nevbWAqMZM9WxEQ9lVVPnjAhESLWUM4250VOnIN/
 8hbg==
X-Gm-Message-State: AOAM530fOikRrscjlx3BQ/V8mZRkxePCc8z6Pd2ggO2bYgCLOYMf4uU/
 kE8h+GYl+19RiosHrPf9AfoG9ZKX0gzYwQOOpTwVIlZmWKw9PtaW/l6RQ6HTUcdKH8izh0TBIPs
 vecF5ytNDCJgdEfZIfjhWpxeEbQ==
X-Received: by 2002:ac8:1773:: with SMTP id u48mr9877468qtk.259.1598374327300; 
 Tue, 25 Aug 2020 09:52:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPR44U8niNebYvUrKITYg+kbJjP80i+hSedazIwkyueDHLFtKe3ByC0Rxwfw2DlIYaJ18R6g==
X-Received: by 2002:ac8:1773:: with SMTP id u48mr9877443qtk.259.1598374326949; 
 Tue, 25 Aug 2020 09:52:06 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id k3sm12047360qkb.95.2020.08.25.09.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:52:06 -0700 (PDT)
Message-ID: <76392bff28359a88fbdf0857f011e0ed9f666dc4.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 25 Aug 2020 12:52:05 -0400
In-Reply-To: <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
References: <20200824183253.826343-1-lyude@redhat.com>
 <20200824183253.826343-2-lyude@redhat.com>
 <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
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
Reply-To: lyude@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 2020-08-25 at 08:28 +1000, Ben Skeggs wrote:
> On Tue, 25 Aug 2020 at 04:33, Lyude Paul <lyude@redhat.com> wrote:
> > Not entirely sure why this never came up when I originally tested this
> > (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> > appears to cause the display engine to throw an exception on driver
> > init, at least on my ThinkPad P72:
> > 
> > nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c 0000102b
> > 
> > This is magic nvidia speak for "You need to have the DMA notifier offset
> > programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> > this by doing that, and also perform an update afterwards to prevent
> > racing with the GPU when reading capabilities.
> > 
> > Changes since v1:
> > * Don't just program the DMA notifier offset, make sure to actually
> >   perform an update
> I'm not sure there's a need to send an Update() method here, I believe
> GetCapabilities() is an action method on its own right?
> 

I'm not entirely sure about this part tbh. I do know that we need to call
GetCapabilities() _after_ the DMA notifier offset is programmed. But, my
assumption was that if GetCapabilities() requires a DMA notifier offset to store
its results in, we'd probably want to fire an update or something to make sure
that we're not reading before it finishes writing capabilities?

> Ben.
> 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP
> > interlacing support")
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
> >  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > index e341f572c2696..5e86feec3b720 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > @@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
> >  int
> >  core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> >  {
> > -       u32 *push = evo_wait(&disp->core->chan, 2);
> > +       struct nv50_core *core = disp->core;
> > +       u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
> > +       u32 *push;
> > 
> > -       if (push) {
> > -               evo_mthd(push, 0x008c, 1);
> > -               evo_data(push, 0x0);
> > -               evo_kick(push, &disp->core->chan);
> > -       }
> > +       core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> > +
> > +       push = evo_wait(&core->chan, 4);
> > +       if (!push)
> > +               return 0;
> > +
> > +       evo_mthd(push, 0x0084, 1);
> > +       evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
> > +       evo_mthd(push, 0x008c, 1);
> > +       evo_data(push, 0x0);
> > +       evo_kick(push, &core->chan);
> > +
> > +       core->func->update(core, interlock, false);
> > +       if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
> > +                                      core->chan.base.device))
> > +               NV_ERROR(drm, "core notifier timeout\n");
> > 
> >         return 0;
> >  }
> > --
> > 2.26.2
> > 
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
