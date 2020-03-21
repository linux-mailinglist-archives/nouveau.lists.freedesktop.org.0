Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E518DD08
	for <lists+nouveau@lfdr.de>; Sat, 21 Mar 2020 02:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E075C6E225;
	Sat, 21 Mar 2020 01:03:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019AD6E227
 for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2020 01:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584752583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfCJB1CUZ+VKC9xpB11jLdF74OwFkNnvn3bT5eqNN/Q=;
 b=M+FIKOqbOZllVDSujDXsyxXdaliUFV4uKarM4tbLO0WVa7384l2M9C3FrWFnHpdBUKInjw
 NBE04zfEUy7IhjSYnjMyVq5oh5Wfs2KFFnzhDtXaOP2Yfi1jPDWROzD5ElvRlc/+VgA29e
 nTOkrH7fG6Qk9qel4e39PuX4HSnXfqo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-wpxuk1fGO261ipt7FeM8SA-1; Fri, 20 Mar 2020 21:03:01 -0400
X-MC-Unique: wpxuk1fGO261ipt7FeM8SA-1
Received: by mail-qk1-f199.google.com with SMTP id k16so6926346qkk.16
 for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2020 18:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AjQuPaCjd7Ig4gpbwFISut+nUjzFUAzjw+os+HFJBP8=;
 b=HnZi2bC2QUH+7JOoT13bZ+g/JLVKb9gXms9CIJsIn+ZkyIHqdKzPAslEJWkfF7p7GI
 66eh9Nm6y4IOGQq32lFKFq6FBf4/6e4jXozirz3fMMyRgcQVbq+5FdvIEO7b0k7/zeLb
 vL0/LMfMEKgwQtJ8ROjibWY/irGazRO92WD6Sz5pRwXC0N/ge2Qhff54rJPGITfR0xIV
 lvEir1vcyNV1XcbWBNWy3j5QaO4j3pYogdji5KzFUrH1HkEmTVOECE7OLPzGvtMm6s1r
 I4D3ZndMaMW8w89dCqc0d+1U9t7c8+czWEfvJs22jNCTyDYDIE//jDyDhOf++Mxz1BY0
 aMyg==
X-Gm-Message-State: ANhLgQ342Zq0/918C3henrYyQvaDND79QrZB5Z0zRdTJ4Dpg5Dpp7pvL
 iwM7bODJsU7KuSLvVYie9uiAmDuaAosWjD9E8oCPs1fbsPNHyc0+9fTDEhJGXOQX6RxvTmjY1DA
 DccdoF3tB3SjyXZYP9a0bw1uHEc3Q8L8fRL03RbfV6A==
X-Received: by 2002:a37:9f42:: with SMTP id i63mr11208510qke.192.1584752581297; 
 Fri, 20 Mar 2020 18:03:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtCh2wJtD/g8xto3BH0cPBIK4C3l4y4LBkjZ5hI622fvjzhRRZrgbDgis1CB+9R05hCeHqJZDHrFD188Ry1ESA=
X-Received: by 2002:a37:9f42:: with SMTP id i63mr11208481qke.192.1584752580926; 
 Fri, 20 Mar 2020 18:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200310192627.437947-1-kherbst@redhat.com>
 <20200320221931.GA23783@google.com>
In-Reply-To: <20200320221931.GA23783@google.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 21 Mar 2020 02:02:22 +0100
Message-ID: <CACO55tsamLG5WE16U=psJpRWfz=7Fy5K8haGKHnhic1h0WAmqA@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH v7] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 11:19 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Mar 10, 2020 at 08:26:27PM +0100, Karol Herbst wrote:
> > Fixes the infamous 'runtime PM' bug many users are facing on Laptops with
> > Nvidia Pascal GPUs by skipping said PCI power state changes on the GPU.
> >
> > Depending on the used kernel there might be messages like those in demsg:
> >
> > "nouveau 0000:01:00.0: Refused to change power state, currently in D3"
> > "nouveau 0000:01:00.0: can't change power state from D3cold to D0 (config
> > space inaccessible)"
> > followed by backtraces of kernel crashes or timeouts within nouveau.
> >
> > It's still unkown why this issue exists, but this is a reliable workaround
> > and solves a very annoying issue for user having to choose between a
> > crashing kernel or higher power consumption of their Laptops.
>
> Thanks for the bugzilla link.  The bugzilla mentions lots of mailing
> list discussion.  Can you include links to some of that?
>
> IIUC this basically just turns off PCI power management for the GPU.
> Can you do that with something like the following?  I don't know
> anything about DRM, so I don't know where you could save the pm_cap,
> but I'm sure the driver could keep it somewhere.
>

Sure this would work? From a quick look over the pci code, it looks
like a of code would be skipped we really need, like the platform code
to turn off the GPU via ACPI. But I could also remember incorrectly on
how all of that worked again. I can of course try and see what the
effect of this patch would be. And would the parent bus even go into
D3hot if it knows one of its children is still at D0? Because that's
what the result of that would be as well, no? And I know that if the
bus stays in D0, that it has a negative impact on power consumption.

Anyway, I will try that out, I am just not seeing how that would help.

>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index b65ae817eabf..2ad825e8891c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -618,6 +618,23 @@ nouveau_drm_device_fini(struct drm_device *dev)
>         kfree(drm);
>  }
>
> +static void quirk_broken_nv_runpm(struct drm_device *drm_dev)
> +{
> +       struct pci_dev *pdev = drm_dev->pdev;
> +       struct pci_dev *bridge = pci_upstream_bridge(pdev);
> +
> +       if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
> +               return;
> +
> +       switch (bridge->device) {
> +       case 0x1901:
> +               STASH->pm_cap = pdev->pm_cap;
> +               pdev->pm_cap = 0;
> +               NV_INFO(drm_dev, "Disabling PCI power management to avoid bug\n");
> +               break;
> +       }
> +}
> +
>  static int nouveau_drm_probe(struct pci_dev *pdev,
>                              const struct pci_device_id *pent)
>  {
> @@ -699,6 +716,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>         if (ret)
>                 goto fail_drm_dev_init;
>
> +       quirk_broken_nv_runpm(drm_dev);
>         return 0;
>
>  fail_drm_dev_init:
> @@ -735,6 +753,9 @@ nouveau_drm_remove(struct pci_dev *pdev)
>  {
>         struct drm_device *dev = pci_get_drvdata(pdev);
>
> +       /* If we disabled PCI power management, restore it */
> +       if (STASH->pm_cap)
> +               pdev->pm_cap = STASH->pm_cap;
>         nouveau_drm_device_remove(dev);
>         pci_disable_device(pdev);
>  }
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
