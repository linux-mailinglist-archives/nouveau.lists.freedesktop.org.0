Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062609377BF
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 14:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D43110EBFF;
	Fri, 19 Jul 2024 12:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eNw2uIKg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1A310E040
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 12:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721392125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7n/Fb/Qyl3wpDBXugz/p+j5/bxJZvnFnud1J5+8n1g=;
 b=eNw2uIKgljbPlc8/wdALnnUvMrezi6yGk76iAU0yCHqJk1WJ3/qPwbO9FC2r+OTnY2/4/v
 TOlT4cTGcSTWerrzMw3zGckGjUREa7MPNn4XSj+/wWgbjJQljB25X8ieyotKrx0TXNLMoO
 Ul0JtKmd/skDF5rm0a8Pjy8uCPppE0g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-KRNApp5IN_2Ax8RCIpMxqQ-1; Fri, 19 Jul 2024 08:28:42 -0400
X-MC-Unique: KRNApp5IN_2Ax8RCIpMxqQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3687529b63fso624050f8f.2
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 05:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721392121; x=1721996921;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7n/Fb/Qyl3wpDBXugz/p+j5/bxJZvnFnud1J5+8n1g=;
 b=CCW9vDV7TexiVvWs+6L1jilG6SDzLflf3fw5KCy0UeJ531zkYoLO0m/xqL+KUd764Q
 MKUz2FcRun9V9dmwip/Ymy30aH76FfhFgqd996rXC7EADH5/GoL7/6JOfaC9WwrMvwee
 ugXjfTiBpbZM5hKtRhfn1wfm2R0zxBLQjnIuCS8hPIp9F3Grgq7bR6ZJOQuAVjcftGLm
 2donRKWJo0gbKi0tiKttm+2kqZdDvQsJpV8QPaEW/vl4hE/KTOfw3uDvzlH9/FKGo6Kx
 V++T6cmcm2rmdNI/mBEOs7Z7EBScOhsB8GTOUmUkX6VX9BLkOgrvlo1p0K5uPPtS+X3U
 tRng==
X-Gm-Message-State: AOJu0YzOKCtZYGyvclhDDX3HO5i9n8Sq7de9pAXmP2/pP1eiU49OG61n
 b8rqEiqWYoa43+5caau3qn5UltS3IiZFx1dQ7FPGU4lvDh3AfoN7pNTH8mLXm7AnQsrOpyi256k
 e4hrVDhIRZzVj5qwMyq34QMZm17Y4MIYsGGQliIsVtOGHvYoZOyJ12ikspC9np65+FkBixtc=
X-Received: by 2002:a05:6000:e49:b0:368:4e38:790c with SMTP id
 ffacd0b85a97d-3684e3879ccmr3136192f8f.14.1721392120553; 
 Fri, 19 Jul 2024 05:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErQggNrtob6OKjZMW9xMLivq54swYgkcABHqWPqef5rQQz0JweAoUam89OYfweSV2z1dDZuA==
X-Received: by 2002:a05:6000:e49:b0:368:4e38:790c with SMTP id
 ffacd0b85a97d-3684e3879ccmr3136178f8f.14.1721392119970; 
 Fri, 19 Jul 2024 05:28:39 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368785c58e7sm1518045f8f.0.2024.07.19.05.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 05:28:39 -0700 (PDT)
Date: Fri, 19 Jul 2024 14:28:37 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 27/37] drm/nouveau: move nvxx_* definitions to
 nouveau_drv.h
Message-ID: <Zppb9T40lRoYCS4v@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-28-bskeggs@nvidia.com>
 <Zo1lzHnx54GT3M1D@pollux>
 <58b5742f-36f5-4108-8a47-a52f3f0ba298@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <58b5742f-36f5-4108-8a47-a52f3f0ba298@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, Jul 18, 2024 at 05:58:20PM +1000, Ben Skeggs wrote:
> On 10/7/24 02:31, Danilo Krummrich wrote:
> 
> > On Fri, Jul 05, 2024 at 04:37:11AM +1000, Ben Skeggs wrote:
> > > These are some dodgy "convenience" macros for the DRM driver to peek
> > > into NVKM state.  They're still used in a few places, but don't belong
> > > in nvif/device.h in any case.
> > > 
> > > Move them to nouveau_drv.h, and modify callers to pass a nouveau_drm
> > > instead of an nvif_device.
> > > 
> > > v2:
> > > - use drm->nvkm pointer for nvxx_*() macros, removing some void*
> > > 
> > > Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  4 +-
> > >   drivers/gpu/drm/nouveau/dispnv04/dac.c        |  2 +-
> > >   drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  2 +-
> > >   drivers/gpu/drm/nouveau/dispnv04/disp.c       |  2 +-
> > >   drivers/gpu/drm/nouveau/dispnv04/disp.h       |  2 +-
> > >   drivers/gpu/drm/nouveau/dispnv04/hw.c         |  9 ++--
> > >   drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |  4 +-
> > >   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  6 +--
> > >   drivers/gpu/drm/nouveau/dispnv50/disp.c       |  6 +--
> > >   drivers/gpu/drm/nouveau/include/nvif/device.h | 33 -------------
> > >   drivers/gpu/drm/nouveau/include/nvif/object.h |  2 +-
> > >   drivers/gpu/drm/nouveau/nouveau_abi16.c       |  4 +-
> > >   drivers/gpu/drm/nouveau/nouveau_bios.c        |  4 +-
> > >   drivers/gpu/drm/nouveau/nouveau_bios.h        |  1 +
> > >   drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 ++--
> > >   drivers/gpu/drm/nouveau/nouveau_chan.c        |  3 +-
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
> > >   drivers/gpu/drm/nouveau/nouveau_drv.h         | 27 +++++++++++
> > >   drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 46 +++++++++----------
> > >   drivers/gpu/drm/nouveau/nouveau_led.c         |  2 +-
> > >   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
> > >   21 files changed, 83 insertions(+), 91 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > > index 4310ad71870b..e5067d5a4801 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > > @@ -118,8 +118,8 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
> > >   {
> > >   	struct drm_device *dev = crtc->dev;
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
> > > -	struct nvkm_clk *clk = nvxx_clk(&drm->client.device);
> > > +	struct nvkm_bios *bios = nvxx_bios(drm);
> > > +	struct nvkm_clk *clk = nvxx_clk(drm);
> > >   	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
> > >   	struct nv04_mode_state *state = &nv04_display(dev)->mode_reg;
> > >   	struct nv04_crtc_reg *regp = &state->crtc_reg[nv_crtc->index];
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
> > > index d6b8e0cce2ac..2e12bf136607 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
> > > @@ -237,7 +237,7 @@ uint32_t nv17_dac_sample_load(struct drm_encoder *encoder)
> > >   	struct drm_device *dev = encoder->dev;
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > >   	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
> > > -	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
> > > +	struct nvkm_gpio *gpio = nvxx_gpio(drm);
> > >   	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
> > >   	uint32_t sample, testval, regoffset = nv04_dac_output_offset(encoder);
> > >   	uint32_t saved_powerctrl_2 = 0, saved_powerctrl_4 = 0, saved_routput,
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> > > index d5b129dc623b..504c421aa176 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> > > @@ -626,7 +626,7 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
> > >   	struct drm_device *dev = encoder->dev;
> > >   	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
> > > +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
> > >   	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, NVKM_I2C_BUS_PRI);
> > >   	struct nvkm_i2c_bus_probe info[] = {
> > >   		{
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> > > index e8b27bb135e7..e563a160571a 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> > > @@ -211,7 +211,7 @@ int
> > >   nv04_display_create(struct drm_device *dev)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
> > > +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
> > >   	struct dcb_table *dcb = &drm->vbios.dcb;
> > >   	struct drm_connector *connector, *ct;
> > >   	struct drm_encoder *encoder;
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
> > > index 11a6663758ec..85ec0f534392 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
> > > @@ -176,7 +176,7 @@ static inline void
> > >   nouveau_bios_run_init_table(struct drm_device *dev, u16 table,
> > >   			    struct dcb_output *outp, int crtc)
> > >   {
> > > -	nvbios_init(&nvxx_bios(&nouveau_drm(dev)->client.device)->subdev, table,
> > > +	nvbios_init(&nvxx_bios(nouveau_drm(dev))->subdev, table,
> > >   		init.outp = outp;
> > >   		init.head = crtc;
> > >   	);
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
> > > index f7d35657aa64..8b376f9c8746 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
> > > @@ -166,7 +166,7 @@ nouveau_hw_get_pllvals(struct drm_device *dev, enum nvbios_pll_type plltype,
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > >   	struct nvif_object *device = &drm->client.device.object;
> > > -	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
> > > +	struct nvkm_bios *bios = nvxx_bios(drm);
> > >   	uint32_t reg1, pll1, pll2 = 0;
> > >   	struct nvbios_pll pll_lim;
> > >   	int ret;
> > > @@ -258,9 +258,8 @@ nouveau_hw_fix_bad_vpll(struct drm_device *dev, int head)
> > >   	 */
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvif_device *device = &drm->client.device;
> > > -	struct nvkm_clk *clk = nvxx_clk(device);
> > > -	struct nvkm_bios *bios = nvxx_bios(device);
> > > +	struct nvkm_clk *clk = nvxx_clk(drm);
> > > +	struct nvkm_bios *bios = nvxx_bios(drm);
> > >   	struct nvbios_pll pll_lim;
> > >   	struct nvkm_pll_vals pv;
> > >   	enum nvbios_pll_type pll = head ? PLL_VPLL1 : PLL_VPLL0;
> > > @@ -470,7 +469,7 @@ nv_load_state_ramdac(struct drm_device *dev, int head,
> > >   		     struct nv04_mode_state *state)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_clk *clk = nvxx_clk(&drm->client.device);
> > > +	struct nvkm_clk *clk = nvxx_clk(drm);
> > >   	struct nv04_crtc_reg *regp = &state->crtc_reg[head];
> > >   	uint32_t pllreg = head ? NV_RAMDAC_VPLL2 : NV_PRAMDAC_VPLL_COEFF;
> > >   	int i;
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
> > > index de3ea731d6e6..d3014027a812 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
> > > @@ -53,7 +53,7 @@ static struct nvkm_i2c_bus_probe nv04_tv_encoder_info[] = {
> > >   int nv04_tv_identify(struct drm_device *dev, int i2c_index)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
> > > +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
> > >   	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, i2c_index);
> > >   	if (bus) {
> > >   		return nvkm_i2c_bus_probe(bus, "TV encoder",
> > > @@ -205,7 +205,7 @@ nv04_tv_create(struct drm_connector *connector, struct dcb_output *entry)
> > >   	struct drm_encoder *encoder;
> > >   	struct drm_device *dev = connector->dev;
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
> > > +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
> > >   	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, entry->i2c_index);
> > >   	int type, ret;
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> > > index 670c9739e5e1..c11f58033018 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> > > @@ -47,7 +47,7 @@ static uint32_t nv42_tv_sample_load(struct drm_encoder *encoder)
> > >   {
> > >   	struct drm_device *dev = encoder->dev;
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
> > > +	struct nvkm_gpio *gpio = nvxx_gpio(drm);
> > >   	uint32_t testval, regoffset = nv04_dac_output_offset(encoder);
> > >   	uint32_t gpio0, gpio1, fp_htotal, fp_hsync_start, fp_hsync_end,
> > >   		fp_control, test_ctrl, dacclk, ctv_14, ctv_1c, ctv_6c;
> > > @@ -131,7 +131,7 @@ static bool
> > >   get_tv_detect_quirks(struct drm_device *dev, uint32_t *pin_mask)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_device *device = nvxx_device(&drm->client.device);
> > > +	struct nvkm_device *device = nvxx_device(drm);
> > >   	if (device->quirk && device->quirk->tv_pin_mask) {
> > >   		*pin_mask = device->quirk->tv_pin_mask;
> > > @@ -363,7 +363,7 @@ static void  nv17_tv_dpms(struct drm_encoder *encoder, int mode)
> > >   {
> > >   	struct drm_device *dev = encoder->dev;
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
> > > +	struct nvkm_gpio *gpio = nvxx_gpio(drm);
> > >   	struct nv17_tv_state *regs = &to_tv_enc(encoder)->state;
> > >   	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > index 42375f757d7c..80803346b620 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > @@ -561,7 +561,7 @@ nv50_dac_create(struct nouveau_encoder *nv_encoder)
> > >   {
> > >   	struct drm_connector *connector = &nv_encoder->conn->base;
> > >   	struct nouveau_drm *drm = nouveau_drm(connector->dev);
> > > -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
> > > +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
> > >   	struct nvkm_i2c_bus *bus;
> > >   	struct drm_encoder *encoder;
> > >   	struct dcb_output *dcbe = nv_encoder->dcb;
> > > @@ -1884,7 +1884,7 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
> > >   	struct drm_connector *connector = &nv_encoder->conn->base;
> > >   	struct nouveau_connector *nv_connector = nouveau_connector(connector);
> > >   	struct nouveau_drm *drm = nouveau_drm(connector->dev);
> > > -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
> > > +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
> > >   	struct drm_encoder *encoder;
> > >   	struct dcb_output *dcbe = nv_encoder->dcb;
> > >   	struct nv50_disp *disp = nv50_disp(connector->dev);
> > > @@ -2051,7 +2051,7 @@ nv50_pior_create(struct nouveau_encoder *nv_encoder)
> > >   	struct drm_device *dev = connector->dev;
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > >   	struct nv50_disp *disp = nv50_disp(dev);
> > > -	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
> > > +	struct nvkm_i2c *i2c = nvxx_i2c(drm);
> > >   	struct nvkm_i2c_bus *bus = NULL;
> > >   	struct nvkm_i2c_aux *aux = NULL;
> > >   	struct i2c_adapter *ddc;
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
> > > index fec76f4733a4..7877a2a79da9 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvif/device.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
> > > @@ -22,37 +22,4 @@ int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device
> > >   void nvif_device_dtor(struct nvif_device *);
> > >   int  nvif_device_map(struct nvif_device *);
> > >   u64  nvif_device_time(struct nvif_device *);
> > > -
> > > -/*XXX*/
> > > -#include <subdev/bios.h>
> > > -#include <subdev/fb.h>
> > > -#include <subdev/bar.h>
> > > -#include <subdev/gpio.h>
> > > -#include <subdev/clk.h>
> > > -#include <subdev/i2c.h>
> > > -#include <subdev/timer.h>
> > > -#include <subdev/therm.h>
> > > -#include <subdev/pci.h>
> > > -
> > > -#define nvxx_device(a) ({                                                      \
> > > -	struct nvif_device *_device = (a);                                     \
> > > -	struct {                                                               \
> > > -		struct nvkm_object object;                                     \
> > > -		struct nvkm_device *device;                                    \
> > > -	} *_udevice = _device->object.priv;                                    \
> > > -	_udevice->device;                                                      \
> > > -})
> > > -#define nvxx_bios(a) nvxx_device(a)->bios
> > > -#define nvxx_fb(a) nvxx_device(a)->fb
> > > -#define nvxx_gpio(a) nvxx_device(a)->gpio
> > > -#define nvxx_clk(a) nvxx_device(a)->clk
> > > -#define nvxx_i2c(a) nvxx_device(a)->i2c
> > > -#define nvxx_iccsense(a) nvxx_device(a)->iccsense
> > > -#define nvxx_therm(a) nvxx_device(a)->therm
> > > -#define nvxx_volt(a) nvxx_device(a)->volt
> > > -
> > > -#include <engine/fifo.h>
> > > -#include <engine/gr.h>
> > > -
> > > -#define nvxx_gr(a) nvxx_device(a)->gr
> > >   #endif
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
> > > index 8d205b6af46a..3534b241cad9 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvif/object.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
> > > @@ -15,7 +15,7 @@ struct nvif_object {
> > >   	const char *name;
> > >   	u32 handle;
> > >   	s32 oclass;
> > > -	void *priv; /*XXX: hack */
> > > +	void *priv;
> > >   	struct {
> > >   		void __iomem *ptr;
> > >   		u64 size;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > index 704977530b6b..5d74c36a4ca5 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > @@ -240,8 +240,8 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> > >   	struct nouveau_cli *cli = nouveau_cli(file_priv);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > >   	struct nvif_device *device = &drm->client.device;
> > > -	struct nvkm_device *nvkm_device = nvxx_device(&drm->client.device);
> > > -	struct nvkm_gr *gr = nvxx_gr(device);
> > > +	struct nvkm_device *nvkm_device = nvxx_device(drm);
> > > +	struct nvkm_gr *gr = nvxx_gr(drm);
> > >   	struct drm_nouveau_getparam *getparam = data;
> > >   	struct pci_dev *pdev = to_pci_dev(dev->dev);
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> > > index 79cfab53f80e..a8da6492efd3 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> > > @@ -2020,7 +2020,7 @@ uint8_t *nouveau_bios_embedded_edid(struct drm_device *dev)
> > >   static bool NVInitVBIOS(struct drm_device *dev)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
> > > +	struct nvkm_bios *bios = nvxx_bios(drm);
> > >   	struct nvbios *legacy = &drm->vbios;
> > >   	memset(legacy, 0, sizeof(struct nvbios));
> > > @@ -2091,7 +2091,7 @@ nouveau_bios_init(struct drm_device *dev)
> > >   	/* only relevant for PCI devices */
> > >   	if (!dev_is_pci(dev->dev) ||
> > > -	    nvkm_gsp_rm(nvxx_device(&drm->client.device)->gsp))
> > > +	    nvkm_gsp_rm(nvxx_device(drm)->gsp))
> > >   		return 0;
> > >   	if (!NVInitVBIOS(dev))
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
> > > index 18eb061ccafb..62b5f5889041 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_bios.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
> > > @@ -48,6 +48,7 @@ struct bit_entry {
> > >   int bit_table(struct drm_device *, u8 id, struct bit_entry *);
> > > +#include <subdev/bios.h>
> > >   #include <subdev/bios/dcb.h>
> > >   #include <subdev/bios/conn.h>
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > index 0712d0b15170..6631d85ea749 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > @@ -58,7 +58,7 @@ nv10_bo_update_tile_region(struct drm_device *dev, struct nouveau_drm_tile *reg,
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > >   	int i = reg - drm->tile.reg;
> > > -	struct nvkm_fb *fb = nvxx_fb(&drm->client.device);
> > > +	struct nvkm_fb *fb = nvxx_fb(drm);
> > >   	struct nvkm_fb_tile *tile = &fb->tile.region[i];
> > >   	nouveau_fence_unref(&reg->fence);
> > > @@ -109,7 +109,7 @@ nv10_bo_set_tiling(struct drm_device *dev, u32 addr,
> > >   		   u32 size, u32 pitch, u32 zeta)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_fb *fb = nvxx_fb(&drm->client.device);
> > > +	struct nvkm_fb *fb = nvxx_fb(drm);
> > >   	struct nouveau_drm_tile *tile, *found = NULL;
> > >   	int i;
> > > @@ -1171,7 +1171,7 @@ static int
> > >   nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_bdev(bdev);
> > > -	struct nvkm_device *device = nvxx_device(&drm->client.device);
> > > +	struct nvkm_device *device = nvxx_device(drm);
> > >   	struct nouveau_mem *mem = nouveau_mem(reg);
> > >   	struct nvif_mmu *mmu = &drm->client.mmu;
> > >   	int ret;
> > > @@ -1291,7 +1291,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
> > >   	struct nouveau_bo *nvbo = nouveau_bo(bo);
> > > -	struct nvkm_device *device = nvxx_device(&drm->client.device);
> > > +	struct nvkm_device *device = nvxx_device(drm);
> > >   	u32 mappable = device->func->resource_size(device, 1) >> PAGE_SHIFT;
> > >   	int i, ret;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > index ce04c40e6f8f..0105d4704c3a 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > @@ -218,8 +218,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
> > >   			 */
> > >   			args.target = NV_DMA_V0_TARGET_PCI;
> > >   			args.access = NV_DMA_V0_ACCESS_RDWR;
> > > -			args.start = nvxx_device(device)->func->
> > > -				resource_addr(nvxx_device(device), 1);
> > > +			args.start = nvxx_device(drm)->func->resource_addr(nvxx_device(drm), 1);
> > >   			args.limit = args.start + device->info.ram_user - 1;
> > >   		} else {
> > >   			args.target = NV_DMA_V0_TARGET_VRAM;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > index 936eb32fc8c4..5ff116bcbabf 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > @@ -424,8 +424,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
> > >   	 * any GPU where it's possible we'll end up using M2MF for BO moves.
> > >   	 */
> > >   	if (device->info.family < NV_DEVICE_INFO_V0_FERMI) {
> > > -		ret = nvkm_gpuobj_new(nvxx_device(device), 32, 0, false, NULL,
> > > -				      &drm->notify);
> > > +		ret = nvkm_gpuobj_new(nvxx_device(drm), 32, 0, false, NULL, &drm->notify);
> > >   		if (ret) {
> > >   			NV_ERROR(drm, "failed to allocate notifier, %d\n", ret);
> > >   			nouveau_accel_gr_fini(drm);
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > index 80ffe15ba76b..a9e0a63c772e 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > @@ -360,4 +360,31 @@ void nouveau_drm_device_remove(struct nouveau_drm *);
> > >   extern int nouveau_modeset;
> > > +/*XXX*/
> > What is the message of this here?
> This is moved over from its old location.

Just to clarify, because I think it came across this way in a few other patches.
I try to avoid putting a question, when I actually look for an action. So, when
I ask a question, no need to assume that I want something changed. :)

> > 
> > > +#include <subdev/bios.h>
> > > +#include <subdev/fb.h>
> > > +#include <subdev/gpio.h>
> > > +#include <subdev/clk.h>
> > > +#include <subdev/i2c.h>
> > > +#include <subdev/timer.h>
> > > +#include <subdev/therm.h>
> > > +
> > > +static inline struct nvkm_device *
> > > +nvxx_device(struct nouveau_drm *drm)
> > > +{
> > > +	return drm->nvkm;
> > > +}
> > > +
> > > +#define nvxx_bios(a) nvxx_device(a)->bios
> > > +#define nvxx_fb(a) nvxx_device(a)->fb
> > > +#define nvxx_gpio(a) nvxx_device(a)->gpio
> > > +#define nvxx_clk(a) nvxx_device(a)->clk
> > > +#define nvxx_i2c(a) nvxx_device(a)->i2c
> > > +#define nvxx_iccsense(a) nvxx_device(a)->iccsense
> > > +#define nvxx_therm(a) nvxx_device(a)->therm
> > > +#define nvxx_volt(a) nvxx_device(a)->volt
> > Why the "nvxx" prefix? Why not just "nvkm"?
> 
> Because these aren't supposed to be used, and exist for the few locations
> that never got proper NVIF.  I've added info to the commit with some further
> explanation.

Thanks for adding it, looks good!

One question regarding that, you write:

"Outside of the current use, these should not be relied on, and proper
interfaces implemented instead."

What would a "proper" interface for those offer us / improve? And if the answer
is nothing, why do we consider using nvkm_ structures directly a hack?

> 
> I've updated the branch on gitlab for this, and your commit message
> nitpicks.
> 
> > 
> > > +
> > > +#include <engine/gr.h>
> > > +
> > > +#define nvxx_gr(a) nvxx_device(a)->gr
> > >   #endif
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > index db30a4c2cd4d..5c07a9ee8b77 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > @@ -52,7 +52,7 @@ nouveau_hwmon_temp1_auto_point1_temp(struct device *d,
> > >   {
> > >   	struct drm_device *dev = dev_get_drvdata(d);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	return sysfs_emit(buf, "%d\n",
> > >   			  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000);
> > > @@ -64,7 +64,7 @@ nouveau_hwmon_set_temp1_auto_point1_temp(struct device *d,
> > >   {
> > >   	struct drm_device *dev = dev_get_drvdata(d);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	long value;
> > >   	if (kstrtol(buf, 10, &value))
> > > @@ -85,7 +85,7 @@ nouveau_hwmon_temp1_auto_point1_temp_hyst(struct device *d,
> > >   {
> > >   	struct drm_device *dev = dev_get_drvdata(d);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	return sysfs_emit(buf, "%d\n",
> > >   			  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) * 1000);
> > > @@ -97,7 +97,7 @@ nouveau_hwmon_set_temp1_auto_point1_temp_hyst(struct device *d,
> > >   {
> > >   	struct drm_device *dev = dev_get_drvdata(d);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	long value;
> > >   	if (kstrtol(buf, 10, &value))
> > > @@ -118,7 +118,7 @@ nouveau_hwmon_get_pwm1_max(struct device *d,
> > >   {
> > >   	struct drm_device *dev = dev_get_drvdata(d);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	int ret;
> > >   	ret = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MAX_DUTY);
> > > @@ -134,7 +134,7 @@ nouveau_hwmon_get_pwm1_min(struct device *d,
> > >   {
> > >   	struct drm_device *dev = dev_get_drvdata(d);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	int ret;
> > >   	ret = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MIN_DUTY);
> > > @@ -150,7 +150,7 @@ nouveau_hwmon_set_pwm1_min(struct device *d, struct device_attribute *a,
> > >   {
> > >   	struct drm_device *dev = dev_get_drvdata(d);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	long value;
> > >   	int ret;
> > > @@ -173,7 +173,7 @@ nouveau_hwmon_set_pwm1_max(struct device *d, struct device_attribute *a,
> > >   {
> > >   	struct drm_device *dev = dev_get_drvdata(d);
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	long value;
> > >   	int ret;
> > > @@ -247,7 +247,7 @@ static umode_t
> > >   nouveau_power_is_visible(const void *data, u32 attr, int channel)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> > > -	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
> > > +	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
> > >   	if (!iccsense || !iccsense->data_valid || list_empty(&iccsense->rails))
> > >   		return 0;
> > > @@ -272,7 +272,7 @@ static umode_t
> > >   nouveau_temp_is_visible(const void *data, u32 attr, int channel)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	if (!therm || !therm->attr_get || nvkm_therm_temp_get(therm) < 0)
> > >   		return 0;
> > > @@ -296,7 +296,7 @@ static umode_t
> > >   nouveau_pwm_is_visible(const void *data, u32 attr, int channel)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	if (!therm || !therm->attr_get || !therm->fan_get ||
> > >   	    therm->fan_get(therm) < 0)
> > > @@ -315,7 +315,7 @@ static umode_t
> > >   nouveau_input_is_visible(const void *data, u32 attr, int channel)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> > > -	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
> > > +	struct nvkm_volt *volt = nvxx_volt(drm);
> > >   	if (!volt || nvkm_volt_get(volt) < 0)
> > >   		return 0;
> > > @@ -335,7 +335,7 @@ static umode_t
> > >   nouveau_fan_is_visible(const void *data, u32 attr, int channel)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	if (!therm || !therm->attr_get || nvkm_therm_fan_sense(therm) < 0)
> > >   		return 0;
> > > @@ -367,7 +367,7 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
> > >   {
> > >   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > >   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	int ret;
> > >   	if (!therm || !therm->attr_get)
> > > @@ -416,7 +416,7 @@ nouveau_fan_read(struct device *dev, u32 attr, int channel, long *val)
> > >   {
> > >   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > >   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	if (!therm)
> > >   		return -EOPNOTSUPP;
> > > @@ -439,7 +439,7 @@ nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)
> > >   {
> > >   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > >   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> > > -	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
> > > +	struct nvkm_volt *volt = nvxx_volt(drm);
> > >   	int ret;
> > >   	if (!volt)
> > > @@ -470,7 +470,7 @@ nouveau_pwm_read(struct device *dev, u32 attr, int channel, long *val)
> > >   {
> > >   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > >   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	if (!therm || !therm->attr_get || !therm->fan_get)
> > >   		return -EOPNOTSUPP;
> > > @@ -496,7 +496,7 @@ nouveau_power_read(struct device *dev, u32 attr, int channel, long *val)
> > >   {
> > >   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > >   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> > > -	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
> > > +	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
> > >   	if (!iccsense)
> > >   		return -EOPNOTSUPP;
> > > @@ -525,7 +525,7 @@ nouveau_temp_write(struct device *dev, u32 attr, int channel, long val)
> > >   {
> > >   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > >   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	if (!therm || !therm->attr_set)
> > >   		return -EOPNOTSUPP;
> > > @@ -559,7 +559,7 @@ nouveau_pwm_write(struct device *dev, u32 attr, int channel, long val)
> > >   {
> > >   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> > >   	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > >   	if (!therm || !therm->attr_set)
> > >   		return -EOPNOTSUPP;
> > > @@ -664,9 +664,9 @@ nouveau_hwmon_init(struct drm_device *dev)
> > >   {
> > >   #if defined(CONFIG_HWMON) || (defined(MODULE) && defined(CONFIG_HWMON_MODULE))
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
> > > -	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> > > -	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
> > > +	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
> > > +	struct nvkm_therm *therm = nvxx_therm(drm);
> > > +	struct nvkm_volt *volt = nvxx_volt(drm);
> > >   	const struct attribute_group *special_groups[N_ATTR_GROUPS];
> > >   	struct nouveau_hwmon *hwmon;
> > >   	struct device *hwmon_dev;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_led.c b/drivers/gpu/drm/nouveau/nouveau_led.c
> > > index 2c5e0628da12..ac950518a820 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_led.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_led.c
> > > @@ -78,7 +78,7 @@ int
> > >   nouveau_led_init(struct drm_device *dev)
> > >   {
> > >   	struct nouveau_drm *drm = nouveau_drm(dev);
> > > -	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
> > > +	struct nvkm_gpio *gpio = nvxx_gpio(drm);
> > >   	struct dcb_gpio_func logo_led;
> > >   	int ret;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > > index 486f39f31a38..53553819bcac 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > > @@ -261,7 +261,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
> > >   int
> > >   nouveau_ttm_init(struct nouveau_drm *drm)
> > >   {
> > > -	struct nvkm_device *device = nvxx_device(&drm->client.device);
> > > +	struct nvkm_device *device = nvxx_device(drm);
> > >   	struct nvkm_pci *pci = device->pci;
> > >   	struct nvif_mmu *mmu = &drm->client.mmu;
> > >   	struct drm_device *dev = drm->dev;
> > > @@ -348,7 +348,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
> > >   void
> > >   nouveau_ttm_fini(struct nouveau_drm *drm)
> > >   {
> > > -	struct nvkm_device *device = nvxx_device(&drm->client.device);
> > > +	struct nvkm_device *device = nvxx_device(drm);
> > >   	nouveau_ttm_fini_vram(drm);
> > >   	nouveau_ttm_fini_gtt(drm);
> > > -- 
> > > 2.45.1
> > > 
> 

