Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA7956ED3
	for <lists+nouveau@lfdr.de>; Mon, 19 Aug 2024 17:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F97210E2CD;
	Mon, 19 Aug 2024 15:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SFQi5CtY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB75C10E2CD;
 Mon, 19 Aug 2024 15:34:04 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5befe420fc2so1312536a12.3; 
 Mon, 19 Aug 2024 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724081643; x=1724686443; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6H6tvr7LLOGIi+/eAQUVoKKVLlXDehRHUQOShd7fWHI=;
 b=SFQi5CtYYVwfwqhzqxdTOOKIxjNAsHJ4VmS3Hq/w3lwvK2FQWtQvhxbxQdzd/d9plL
 88CqNVyHbILrImaM5+XjzK+CzfmX/AvuPRqLDmF2qi5epq24+SfmvjD3HSriU+q8EBxv
 yreJXoETuGkGxiaDj1jth1TCBVP2w23ZSmK8TgT+EO8fIZEvR8KA9AJxR2ta40onkazW
 c5+tslFmMhV7wpxUhXPdfZImz3DVITpuBEr/a82OOFXofc1LJcbpvTeBUVtWPe63COf1
 EocdjCzbFHwTJOvNAR2Ak+jdn7LSzSUtr9qCKhk5Ep9xyykqnY7BQWN6L6UD4lFC1zIc
 PtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724081643; x=1724686443;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6H6tvr7LLOGIi+/eAQUVoKKVLlXDehRHUQOShd7fWHI=;
 b=Ty48yE1ctPXQOooDypLe4oaGabpvf6+s+F/CsayRmyR6ct8MV374NBJXe+FwxyRPES
 VplninctcC8Kxh7EvXct1wWl0o3QJWxUCLy7hVsdzrRcB9TLWX6i16lAbMqJQDrFwVdZ
 TSs5mvgp5UAkkT9UqfUC8d2wlqXpw7HbntH2Sx5rq5q2vDtbL2daiK1GIWaydZM/QLEw
 3p5ua8fD9Cs/4xr3P9ljua18zWTjP576hsh80OHys6Qvcv/+kv/8vRRM3A0VB+hmdRoC
 3xm/V6nWMAXU5a133JSxdZqEtvW9rH2a/wZQe+5dHRpstwNwRALakrOr2ZEHxlmpXoEm
 ypvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0qvvV0NDXM5zjfmiDeicAYkz+ta6cLZPpoygMaCRoPsTkweENpUxaNDtsOw43RqJYiZkUshCMcQ==@lists.freedesktop.org,
 AJvYcCUjUsN2Kn3BhyklW6n4IVAbUdQUkrkUFbLjZiP1C0cvnvM8p89XX8gRZDu5HvK3bxz6C5ylMQIM@lists.freedesktop.org,
 AJvYcCVp3g+WTC7s+pIapBJ5BnJMXlBRohjcPg8B+0HmohzceK2ew5wDve2qbotv1+ZTHmKcghQqkyfGzCSn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZq+Sy3WgE8LUkrSuUiCMi4YOcQ/3xRkYZXSprSrg3ONCpVKHp
 S56tp+mz6VXMQmuy4yw1fFehNIZEyYYG9zkPuXr7UphulWJLhXZgPoAEKVQP08ISKD6Gqt7OBpZ
 yPKhx2c5qdt/pqwO0/rOuP/ENWl0=
X-Google-Smtp-Source: AGHT+IGAbx+LDhms7cAGwrasQ4baiVddLMFBdlhDTvaeKSCRHpL29Ze9LkPQjHO6vz/NeJHCrUfNkz9ZIdbuPBZvGsE=
X-Received: by 2002:a17:907:a088:b0:a7d:a28d:8cd1 with SMTP id
 a640c23a62f3a-a83a9ff2ba9mr494786466b.26.1724081642348; Mon, 19 Aug 2024
 08:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-2-tzimmermann@suse.de>
In-Reply-To: <20240812083000.337744-2-tzimmermann@suse.de>
From: Blake McBride <blake1024@gmail.com>
Date: Mon, 19 Aug 2024 10:33:50 -0500
Message-ID: <CABwHSOsWh_Mbf9dkNqznwZwJbKZqndb79OGCA1xFqc1xzMFXCw@mail.gmail.com>
Subject: Getting off this list
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000db2a7106200b09d3"
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

--000000000000db2a7106200b09d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I do not know which list this is.  How can I get these emails to stop?

Thank you.

On Mon, Aug 12, 2024 at 3:40=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de>
wrote:

> Amdgpu and nouveau call vga_switcheroo_process_delayed_switch() from
> their lastclose callbacks. Call it from drm_lastclose(), so that the
> driver functions can finally be removed. Only PCI devices with enabled
> switcheroo do the delayed switching. The call has no effect on other
> hardware.
>
> v2:
> - move change to drm_lastclose() (Sima)
> - update docs for vga_switcheroo_process_delayed_switch()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_file.c       | 4 ++++
>  drivers/gpu/vga/vga_switcheroo.c | 3 +--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 714e42b05108..513bef816ae9 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>  #include <linux/poll.h>
>  #include <linux/slab.h>
> +#include <linux/vga_switcheroo.h>
>
>  #include <drm/drm_client.h>
>  #include <drm/drm_drv.h>
> @@ -404,6 +405,9 @@ void drm_lastclose(struct drm_device * dev)
>         drm_dbg_core(dev, "driver lastclose completed\n");
>
>         drm_client_dev_restore(dev);
> +
> +       if (dev_is_pci(dev->dev))
> +               vga_switcheroo_process_delayed_switch();
>  }
>
>  /**
> diff --git a/drivers/gpu/vga/vga_switcheroo.c
> b/drivers/gpu/vga/vga_switcheroo.c
> index 365e6ddbe90f..18f2c92beff8 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -926,8 +926,7 @@ static void vga_switcheroo_debugfs_init(struct
> vgasr_priv *priv)
>  /**
>   * vga_switcheroo_process_delayed_switch() - helper for delayed switchin=
g
>   *
> - * Process a delayed switch if one is pending. DRM drivers should call
> this
> - * from their ->lastclose callback.
> + * Process a delayed switch if one is pending.
>   *
>   * Return: 0 on success. -EINVAL if no delayed switch is pending, if the
> client
>   * has unregistered in the meantime or if there are other clients
> blocking the
> --
> 2.46.0
>
>

--000000000000db2a7106200b09d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I do not know=C2=A0which list this is.=C2=A0 How can =
I get these emails to stop?</div><div><br></div><div>Thank you.</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug =
12, 2024 at 3:40=E2=80=AFAM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmer=
mann@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Amdgpu and nouveau call vga_switcheroo_pro=
cess_delayed_switch() from<br>
their lastclose callbacks. Call it from drm_lastclose(), so that the<br>
driver functions can finally be removed. Only PCI devices with enabled<br>
switcheroo do the delayed switching. The call has no effect on other<br>
hardware.<br>
<br>
v2:<br>
- move change to drm_lastclose() (Sima)<br>
- update docs for vga_switcheroo_process_delayed_switch()<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_file.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0drivers/gpu/vga/vga_switcheroo.c | 3 +--<br>
=C2=A02 files changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c<br>
index 714e42b05108..513bef816ae9 100644<br>
--- a/drivers/gpu/drm/drm_file.c<br>
+++ b/drivers/gpu/drm/drm_file.c<br>
@@ -38,6 +38,7 @@<br>
=C2=A0#include &lt;linux/pci.h&gt;<br>
=C2=A0#include &lt;linux/poll.h&gt;<br>
=C2=A0#include &lt;linux/slab.h&gt;<br>
+#include &lt;linux/vga_switcheroo.h&gt;<br>
<br>
=C2=A0#include &lt;drm/drm_client.h&gt;<br>
=C2=A0#include &lt;drm/drm_drv.h&gt;<br>
@@ -404,6 +405,9 @@ void drm_lastclose(struct drm_device * dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_dbg_core(dev, &quot;driver lastclose comple=
ted\n&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_client_dev_restore(dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dev_is_pci(dev-&gt;dev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vga_switcheroo_proc=
ess_delayed_switch();<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switche=
roo.c<br>
index 365e6ddbe90f..18f2c92beff8 100644<br>
--- a/drivers/gpu/vga/vga_switcheroo.c<br>
+++ b/drivers/gpu/vga/vga_switcheroo.c<br>
@@ -926,8 +926,7 @@ static void vga_switcheroo_debugfs_init(struct vgasr_pr=
iv *priv)<br>
=C2=A0/**<br>
=C2=A0 * vga_switcheroo_process_delayed_switch() - helper for delayed switc=
hing<br>
=C2=A0 *<br>
- * Process a delayed switch if one is pending. DRM drivers should call thi=
s<br>
- * from their -&gt;lastclose callback.<br>
+ * Process a delayed switch if one is pending.<br>
=C2=A0 *<br>
=C2=A0 * Return: 0 on success. -EINVAL if no delayed switch is pending, if =
the client<br>
=C2=A0 * has unregistered in the meantime or if there are other clients blo=
cking the<br>
-- <br>
2.46.0<br>
<br>
</blockquote></div></div>

--000000000000db2a7106200b09d3--
