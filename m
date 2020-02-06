Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB6B15486F
	for <lists+nouveau@lfdr.de>; Thu,  6 Feb 2020 16:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075006FA8E;
	Thu,  6 Feb 2020 15:47:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E982A6FA8E
 for <nouveau@lists.freedesktop.org>; Thu,  6 Feb 2020 15:47:54 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id g23so4055321vsr.7
 for <nouveau@lists.freedesktop.org>; Thu, 06 Feb 2020 07:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06oy0qHcxDSQbZ9BNPdaVzSLAkjiPfA2FC/YW2LB1eg=;
 b=EiTc3kVm0ss1Pw8YlediJKtYhHsGS5tILcDJD7WDjdYp4mmq9aigZkxXIUVVY1rwht
 skbo5O0HYoiYl1peYUE3IQz1YiQOU0L5fU5IGXGvvpYshu0fdTmbXwqCCACdvDfGOHgG
 AOB6URLmAl09CX7+f0HPBe9KYbhGLYde9V6RsYg13yFjTFfwdAkTbspcvuIqGXDMGZZ1
 ttf3I8kMZBQ1UjsBrNNYIMZDQ4yAH2RwI1LFRQTNRzL9BZp3Jsv+9Tf4TdwM3TAkct+r
 eJHPRwc+z7z3UKC0TEHjSLEuzjNy68zaw3M/ye3xyBkc3feyE53y/GSlqOR5ojKDof2U
 2fkQ==
X-Gm-Message-State: APjAAAV3uFAuSwm+Q9cBOoYJGkRhHD+IreesSDb/AS8OHU9bJPzRK3pG
 a4ODCrabDtb839fYmwbdfLHXjw90NwKzncC2CKY=
X-Google-Smtp-Source: APXvYqxnARfczJavvdVZ92gm3hiBlXjZWJMGsuHFbEzX5i+hb/4LJyrUJK/zl6u6M9R56dLv439k0cSflyFJn3Rc3Dc=
X-Received: by 2002:a67:f404:: with SMTP id p4mr2170020vsn.18.1581004073839;
 Thu, 06 Feb 2020 07:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20200206101942.1412-1-tzimmermann@suse.de>
 <20200206101942.1412-5-tzimmermann@suse.de>
 <616dead7-030a-b678-3040-9e317549812e@nvidia.com>
 <18b63f3e-ff2d-1008-84f1-ed9e11b9fcee@spliet.org>
 <e054d258-8e09-06c8-53a2-180042d24c28@nvidia.com>
In-Reply-To: <e054d258-8e09-06c8-53a2-180042d24c28@nvidia.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 6 Feb 2020 10:47:42 -0500
Message-ID: <CAKb7UvgSFH_O=BAD89DNV4oEdEveL6U3c1qaU9Bjioa_mU1dBg@mail.gmail.com>
To: James Jones <jajones@nvidia.com>
Subject: Re: [Nouveau] [PATCH 4/4] drm/nouveau: Remove struct
 nouveau_framebuffer
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

So ... for Vulkan, the API requires allocating VA before declaring
what goes into that VA (e.g. an image or data). I believe our plan for
that was to move all this into userspace, which would allocate VA and
then just tell the kernel "make VA range X have memtype Y". At that
point, nouveau_bo would be left mainly for compat as well as for
things like framebuffer backing.

James, in what situation would the modifier be different than the bo's memtype?

  -ilia

On Thu, Feb 6, 2020 at 10:43 AM James Jones <jajones@nvidia.com> wrote:
>
> The format modifiers, when present, override the equivalent field in the
> BO.  Right now, that's probably not particularly useful.  However, as
> nouveau interfaces evolve towards the HW capabilities and add support
> for newer graphics APIs, saying an entire BO has a singular layout
> becomes less meaningful, so I suspect those fields will be effectively
> deprecated in favor of the modifier-defined and, for non-FB operations,
> strictly userspace defined layout.  Doing so will be much easier if the
> modifier support is already in place for applications to start making
> use of.
>
> Thanks,
> -James
>
> On 2/6/20 7:28 AM, Roy Spliet wrote:
> > (Re-sending to list rather than just to James)
> >
> > Is this format modifier information not stored, or otherwise worth
> > storing, directly in the nouveau_bo object associated with the
> > framebuffer? I'm not particularly knowledgeable on the topic, but there
> > already seem to exist some fields with very similar names in nouveau_bo.
> > Best,
> >
> > Roy
> >
> > On 06/02/2020 15:17, James Jones wrote:
> >> Note I'm adding some fields to nouveau_framebuffer in the series
> >> "drm/nouveau: Support NVIDIA format modifiers."  I sent out v3 of that
> >> yesterday.  It would probably still be possible to avoid them by
> >> re-extracting the relevant data from the format modifier on the fly
> >> when needed, but it is simpler and likely less error-prone with the
> >> wrapper struct.
> >>
> >> Thanks,
> >> -James
> >>
> >> On 2/6/20 2:19 AM, Thomas Zimmermann wrote:
> >>> After its cleanup, struct nouveau_framebuffer is only a wrapper around
> >>> struct drm_framebuffer. Use the latter directly.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> ---
> >>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 26 +++++++++++------------
> >>>   drivers/gpu/drm/nouveau/nouveau_display.c | 14 ++++++------
> >>>   drivers/gpu/drm/nouveau/nouveau_display.h | 12 +----------
> >>>   drivers/gpu/drm/nouveau/nouveau_fbcon.c   | 14 ++++++------
> >>>   4 files changed, 28 insertions(+), 38 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> >>> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> >>> index ba1399965a1c..4a67a656e007 100644
> >>> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> >>> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> >>> @@ -40,11 +40,11 @@ nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma
> >>> *ctxdma)
> >>>   }
> >>>   static struct nv50_wndw_ctxdma *
> >>> -nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct
> >>> nouveau_framebuffer *fb)
> >>> +nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer
> >>> *fb)
> >>>   {
> >>> -    struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
> >>> +    struct nouveau_drm *drm = nouveau_drm(fb->dev);
> >>>       struct nv50_wndw_ctxdma *ctxdma;
> >>> -    struct nouveau_bo *nvbo = nouveau_gem_object(fb->base.obj[0]);
> >>> +    struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
> >>>       const u8    kind = nvbo->kind;
> >>>       const u32 handle = 0xfb000000 | kind;
> >>>       struct {
> >>> @@ -236,16 +236,16 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw
> >>> *wndw, bool modeset,
> >>>                      struct nv50_wndw_atom *asyw,
> >>>                      struct nv50_head_atom *asyh)
> >>>   {
> >>> -    struct nouveau_framebuffer *fb =
> >>> nouveau_framebuffer(asyw->state.fb);
> >>> +    struct drm_framebuffer *fb = asyw->state.fb;
> >>>       struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
> >>> -    struct nouveau_bo *nvbo = nouveau_gem_object(fb->base.obj[0]);
> >>> +    struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
> >>>       int ret;
> >>>       NV_ATOMIC(drm, "%s acquire\n", wndw->plane.name);
> >>> -    if (asyw->state.fb != armw->state.fb || !armw->visible ||
> >>> modeset) {
> >>> -        asyw->image.w = fb->base.width;
> >>> -        asyw->image.h = fb->base.height;
> >>> +    if (fb != armw->state.fb || !armw->visible || modeset) {
> >>> +        asyw->image.w = fb->width;
> >>> +        asyw->image.h = fb->height;
> >>>           asyw->image.kind = nvbo->kind;
> >>>           ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
> >>> @@ -261,13 +261,13 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw
> >>> *wndw, bool modeset,
> >>>                   asyw->image.blockh = nvbo->mode >> 4;
> >>>               else
> >>>                   asyw->image.blockh = nvbo->mode;
> >>> -            asyw->image.blocks[0] = fb->base.pitches[0] / 64;
> >>> +            asyw->image.blocks[0] = fb->pitches[0] / 64;
> >>>               asyw->image.pitch[0] = 0;
> >>>           } else {
> >>>               asyw->image.layout = 1;
> >>>               asyw->image.blockh = 0;
> >>>               asyw->image.blocks[0] = 0;
> >>> -            asyw->image.pitch[0] = fb->base.pitches[0];
> >>> +            asyw->image.pitch[0] = fb->pitches[0];
> >>>           }
> >>>           if (!asyh->state.async_flip)
> >>> @@ -486,16 +486,16 @@ nv50_wndw_cleanup_fb(struct drm_plane *plane,
> >>> struct drm_plane_state *old_state)
> >>>   static int
> >>>   nv50_wndw_prepare_fb(struct drm_plane *plane, struct
> >>> drm_plane_state *state)
> >>>   {
> >>> -    struct nouveau_framebuffer *fb = nouveau_framebuffer(state->fb);
> >>> +    struct drm_framebuffer *fb = state->fb;
> >>>       struct nouveau_drm *drm = nouveau_drm(plane->dev);
> >>>       struct nv50_wndw *wndw = nv50_wndw(plane);
> >>>       struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
> >>> -    struct nouveau_bo *nvbo = nouveau_gem_object(state->fb->obj[0]);
> >>> +    struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
> >>>       struct nv50_head_atom *asyh;
> >>>       struct nv50_wndw_ctxdma *ctxdma;
> >>>       int ret;
> >>> -    NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, state->fb);
> >>> +    NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
> >>>       if (!asyw->state.fb)
> >>>           return 0;
> >>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c
> >>> b/drivers/gpu/drm/nouveau/nouveau_display.c
> >>> index bbbff55eb5d5..94f7fd48e1cf 100644
> >>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> >>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> >>> @@ -207,10 +207,10 @@ int
> >>>   nouveau_framebuffer_new(struct drm_device *dev,
> >>>               const struct drm_mode_fb_cmd2 *mode_cmd,
> >>>               struct drm_gem_object *gem,
> >>> -            struct nouveau_framebuffer **pfb)
> >>> +            struct drm_framebuffer **pfb)
> >>>   {
> >>>       struct nouveau_drm *drm = nouveau_drm(dev);
> >>> -    struct nouveau_framebuffer *fb;
> >>> +    struct drm_framebuffer *fb;
> >>>       int ret;
> >>>           /* YUV overlays have special requirements pre-NV50 */
> >>> @@ -236,10 +236,10 @@ nouveau_framebuffer_new(struct drm_device *dev,
> >>>       if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
> >>>           return -ENOMEM;
> >>> -    drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
> >>> -    fb->base.obj[0] = gem;
> >>> +    drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> >>> +    fb->obj[0] = gem;
> >>> -    ret = drm_framebuffer_init(dev, &fb->base,
> >>> &nouveau_framebuffer_funcs);
> >>> +    ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
> >>>       if (ret)
> >>>           kfree(fb);
> >>>       return ret;
> >>> @@ -250,7 +250,7 @@ nouveau_user_framebuffer_create(struct drm_device
> >>> *dev,
> >>>                   struct drm_file *file_priv,
> >>>                   const struct drm_mode_fb_cmd2 *mode_cmd)
> >>>   {
> >>> -    struct nouveau_framebuffer *fb;
> >>> +    struct drm_framebuffer *fb;
> >>>       struct drm_gem_object *gem;
> >>>       int ret;
> >>> @@ -260,7 +260,7 @@ nouveau_user_framebuffer_create(struct drm_device
> >>> *dev,
> >>>       ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
> >>>       if (ret == 0)
> >>> -        return &fb->base;
> >>> +        return fb;
> >>>       drm_gem_object_put_unlocked(gem);
> >>>       return ERR_PTR(ret);
> >>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h
> >>> b/drivers/gpu/drm/nouveau/nouveau_display.h
> >>> index 56c1dec8fc28..082bb067d575 100644
> >>> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> >>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> >>> @@ -8,21 +8,11 @@
> >>>   #include <drm/drm_framebuffer.h>
> >>> -struct nouveau_framebuffer {
> >>> -    struct drm_framebuffer base;
> >>> -};
> >>> -
> >>> -static inline struct nouveau_framebuffer *
> >>> -nouveau_framebuffer(struct drm_framebuffer *fb)
> >>> -{
> >>> -    return container_of(fb, struct nouveau_framebuffer, base);
> >>> -}
> >>> -
> >>>   int
> >>>   nouveau_framebuffer_new(struct drm_device *dev,
> >>>               const struct drm_mode_fb_cmd2 *mode_cmd,
> >>>               struct drm_gem_object *gem,
> >>> -            struct nouveau_framebuffer **pfb);
> >>> +            struct drm_framebuffer **pfb);
> >>>   struct nouveau_display {
> >>>       void *priv;
> >>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> >>> b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> >>> index 02b36b44409c..d78bc03ad3b8 100644
> >>> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> >>> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> >>> @@ -312,7 +312,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
> >>>       struct nouveau_drm *drm = nouveau_drm(dev);
> >>>       struct nvif_device *device = &drm->client.device;
> >>>       struct fb_info *info;
> >>> -    struct nouveau_framebuffer *fb;
> >>> +    struct drm_framebuffer *fb;
> >>>       struct nouveau_channel *chan;
> >>>       struct nouveau_bo *nvbo;
> >>>       struct drm_mode_fb_cmd2 mode_cmd;
> >>> @@ -367,7 +367,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
> >>>       }
> >>>       /* setup helper */
> >>> -    fbcon->helper.fb = &fb->base;
> >>> +    fbcon->helper.fb = fb;
> >>>       if (!chan)
> >>>           info->flags = FBINFO_HWACCEL_DISABLED;
> >>> @@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
> >>>       /* To allow resizeing without swapping buffers */
> >>>       NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
> >>> -        fb->base.width, fb->base.height, nvbo->bo.offset, nvbo);
> >>> +        fb->width, fb->height, nvbo->bo.offset, nvbo);
> >>>       vga_switcheroo_client_fb_set(dev->pdev, info);
> >>>       return 0;
> >>> @@ -413,18 +413,18 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
> >>>   static int
> >>>   nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev
> >>> *fbcon)
> >>>   {
> >>> -    struct nouveau_framebuffer *nouveau_fb =
> >>> nouveau_framebuffer(fbcon->helper.fb);
> >>> +    struct drm_framebuffer *fb = fbcon->helper.fb;
> >>>       struct nouveau_bo *nvbo;
> >>>       drm_fb_helper_unregister_fbi(&fbcon->helper);
> >>>       drm_fb_helper_fini(&fbcon->helper);
> >>> -    if (nouveau_fb && nouveau_fb->base.obj[0]) {
> >>> -        nvbo = nouveau_gem_object(nouveau_fb->base.obj[0]);
> >>> +    if (fb && fb->obj[0]) {
> >>> +        nvbo = nouveau_gem_object(fb->obj[0]);
> >>>           nouveau_vma_del(&fbcon->vma);
> >>>           nouveau_bo_unmap(nvbo);
> >>>           nouveau_bo_unpin(nvbo);
> >>> -        drm_framebuffer_put(&nouveau_fb->base);
> >>> +        drm_framebuffer_put(fb);
> >>>       }
> >>>       return 0;
> >>>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
