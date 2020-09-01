Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F082825A028
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 22:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD82289DBF;
	Tue,  1 Sep 2020 20:44:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EED789DBA
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 20:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598993043;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPCf4u3EyicebY387YkKs2a22jsTBC/ti3P+b5RanuE=;
 b=cJQS42KMkVEcu7WSiyYhrW2FlwRb5NKVdzYCN0Y+5EKLMAO8zmUsavCHNLHhHHVWw7Xqt3
 E80EdOwUOIJNYlSIz2mW/uK2YsK72ewD+DuW6lXzRTpni1A1W4IkrOEGgLEE0dIKks1GyF
 k99kPO0MWHP7v5Fu6U4qfnWuEU7sNN0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-AuZqH64wMKevpWfiispvKA-1; Tue, 01 Sep 2020 16:43:58 -0400
X-MC-Unique: AuZqH64wMKevpWfiispvKA-1
Received: by mail-qt1-f198.google.com with SMTP id e11so1943846qth.21
 for <nouveau@lists.freedesktop.org>; Tue, 01 Sep 2020 13:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gPCf4u3EyicebY387YkKs2a22jsTBC/ti3P+b5RanuE=;
 b=m/87Bc+9ACs71tiKEpfGIG6rJMRpM3NfT5mucNOWJ2gOHmrXG4zsT+h4uMgkrZlmo2
 10T/jqjrm1OHG9glC5HlHeLXB+1hRUXPaIZ1UHYzJSAI0piGvF0rAnJRsx8xwzuz5ju9
 IKjxX0O1cIcZdHVvxkr/tn+rV2Ju++vBkyFg7YOon8XBxpAm/phNoibc03bsVBuSfzyi
 cm57HoSzAreM2vXUhvg2L4tWzllUiQ9reSow6Rpc+hPN+qLHvI0kalLSIeiMLg0uXF6u
 jKubw5yPJwrRrLfK5fuI1V0vaGYnnUdXXFgLAel7ApumLWkUeAju3RbXR3nGiKoS1e1t
 nhtA==
X-Gm-Message-State: AOAM533LaEaHWDmdMAnViUMP3JujpUKV0wJAJ/za6MRAK7JLoHrhAlXM
 aqbsB0MZDjE3H2qO2CNc4GmXSHXVDF0qfoNUFeRc4Vjk1gvH/E4Nvten5470jQMwUompAcGVhjg
 s+O73ww3Z7nrhyaZ+Afvm95PYUQ==
X-Received: by 2002:a0c:b2d4:: with SMTP id d20mr3919068qvf.1.1598993038179;
 Tue, 01 Sep 2020 13:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMmHa3fHP8NY/dodaToFLVXTDFVn0f07O4xVQ5hfDgEZxkOry+RenIOt4w6jJJl7+Ml1CEdA==
X-Received: by 2002:a0c:b2d4:: with SMTP id d20mr3919050qvf.1.1598993037914;
 Tue, 01 Sep 2020 13:43:57 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g37sm2892530qtk.76.2020.09.01.13.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 13:43:57 -0700 (PDT)
Message-ID: <c099dc05ff80ea43033c72a52de51165d9b0f6ab.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 01 Sep 2020 16:43:56 -0400
In-Reply-To: <CACAvsv6GKeX=u4Jn0VVJk1qgnPcnPCW6exukqjvfrfmm2mwSUg@mail.gmail.com>
References: <20200824183253.826343-1-lyude@redhat.com>
 <20200824183253.826343-2-lyude@redhat.com>
 <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
 <76392bff28359a88fbdf0857f011e0ed9f666dc4.camel@redhat.com>
 <CACAvsv6GKeX=u4Jn0VVJk1qgnPcnPCW6exukqjvfrfmm2mwSUg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.003
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

On Mon, 2020-08-31 at 14:26 +1000, Ben Skeggs wrote:
> On Wed, 26 Aug 2020 at 02:52, Lyude Paul <lyude@redhat.com> wrote:
> > On Tue, 2020-08-25 at 08:28 +1000, Ben Skeggs wrote:
> > > On Tue, 25 Aug 2020 at 04:33, Lyude Paul <lyude@redhat.com> wrote:
> > > > Not entirely sure why this never came up when I originally tested this
> > > > (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> > > > appears to cause the display engine to throw an exception on driver
> > > > init, at least on my ThinkPad P72:
> > > > 
> > > > nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c
> > > > 0000102b
> > > > 
> > > > This is magic nvidia speak for "You need to have the DMA notifier offset
> > > > programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> > > > this by doing that, and also perform an update afterwards to prevent
> > > > racing with the GPU when reading capabilities.
> > > > 
> > > > Changes since v1:
> > > > * Don't just program the DMA notifier offset, make sure to actually
> > > >   perform an update
> > > I'm not sure there's a need to send an Update() method here, I believe
> > > GetCapabilities() is an action method on its own right?
> > > 
> > 
> > I'm not entirely sure about this part tbh. I do know that we need to call
> > GetCapabilities() _after_ the DMA notifier offset is programmed. But, my
> > assumption was that if GetCapabilities() requires a DMA notifier offset to
> > store
> > its results in, we'd probably want to fire an update or something to make
> > sure
> > that we're not reading before it finishes writing capabilities?
> We definitely want to *wait* on GetCapabilities() finishing, I believe
> it should also update the notifier the same (or similar) way Update()
> does.  But I don't think we want to send an Update() here, it'll
> actually trigger a modeset (which, on earlier HW, will tear down the
> boot mode.  Not sure about current HW, it might preserve state), and
> we may not want that to happen there.

I'm not so sure about that, as it seems like the notifier times out without the
update:

[    5.142033] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000000: 00040088 mthd 0x0088 size 1 - core507d_init
[    5.142037] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000004: f0000000-> NV507D_SET_CONTEXT_DMA_NOTIFIER
[    5.142041] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000008: 00040084 mthd 0x0084 size 1 - core507d_caps_init
[    5.142044] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 0000000c: 80000000-> NV507D_SET_NOTIFIER_CONTROL
[    5.142047] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000010: 0004008c mthd 0x008c size 1 - core507d_caps_init
[    5.142050] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000014: 00000000-> NV507D_GET_CAPABILITIES
[    7.142026] nouveau 0000:1f:00.0: DRM: core notifier timeout
[    7.142700] nouveau 0000:1f:00.0: DRM: sor-0002-0fc1 caps: dp_interlace=0
[    7.142708] nouveau 0000:1f:00.0: DRM: sor-0002-0fc4 caps: dp_interlace=0
[    7.142715] nouveau 0000:1f:00.0: DRM: sor-0002-0f42 caps: dp_interlace=0
[    7.142829] nouveau 0000:1f:00.0: DRM: sor-0006-0f82 caps: dp_interlace=0
[    7.142842] nouveau 0000:1f:00.0: DRM: sor-0002-0f82 caps: dp_interlace=0
[    7.142849] nouveau 0000:1f:00.0: DRM: failed to create encoder 1/8/0: -19
[    7.142851] nouveau 0000:1f:00.0: DRM: Virtual-1 has no encoders, removing

Any other alternatives to UPDATE we might want to try?

> 
> Ben.
> 
> > > Ben.
> > > 
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for
> > > > DP
> > > > interlacing support")
> > > > Cc: <stable@vger.kernel.org> # v5.8+
> > > > ---
> > > >  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
> > > >  1 file changed, 19 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > index e341f572c2696..5e86feec3b720 100644
> > > > --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > @@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32
> > > > offset)
> > > >  int
> > > >  core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> > > >  {
> > > > -       u32 *push = evo_wait(&disp->core->chan, 2);
> > > > +       struct nv50_core *core = disp->core;
> > > > +       u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
> > > > +       u32 *push;
> > > > 
> > > > -       if (push) {
> > > > -               evo_mthd(push, 0x008c, 1);
> > > > -               evo_data(push, 0x0);
> > > > -               evo_kick(push, &disp->core->chan);
> > > > -       }
> > > > +       core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> > > > +
> > > > +       push = evo_wait(&core->chan, 4);
> > > > +       if (!push)
> > > > +               return 0;
> > > > +
> > > > +       evo_mthd(push, 0x0084, 1);
> > > > +       evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
> > > > +       evo_mthd(push, 0x008c, 1);
> > > > +       evo_data(push, 0x0);
> > > > +       evo_kick(push, &core->chan);
> > > > +
> > > > +       core->func->update(core, interlock, false);
> > > > +       if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
> > > > +                                      core->chan.base.device))
> > > > +               NV_ERROR(drm, "core notifier timeout\n");
> > > > 
> > > >         return 0;
> > > >  }
> > > > --
> > > > 2.26.2
> > > > 
> > > > _______________________________________________
> > > > Nouveau mailing list
> > > > Nouveau@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> > --
> > Sincerely,
> >       Lyude Paul (she/her)
> >       Software Engineer at Red Hat
> > 
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
