Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5659F26073B
	for <lists+nouveau@lfdr.de>; Tue,  8 Sep 2020 01:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76D06E0C6;
	Mon,  7 Sep 2020 23:51:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611386E0C2
 for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2020 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599522696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=110Unz5qrB7/Ny3qdZoUTzTeS4D4CUQMCdJdAAxtNLA=;
 b=Wyg1LoNiFWxMlKo2aTQGzbbfrTC2mfWtgVvVhHGNh2n+KulbrXXMfEuU31mFezr6frkngk
 kqFt6Id0dKGdnqW7wMXS4RAE/Uz5O8JozCBJ5YZRfICPZ4GhNfDE1Mxkg0HNjFAjluBryg
 LPEZhr8rTWa2ezPklEWiw4JfUlj1Sh4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-AAZO7Py5Pc-otFfntgL7sQ-1; Mon, 07 Sep 2020 19:51:31 -0400
X-MC-Unique: AAZO7Py5Pc-otFfntgL7sQ-1
Received: by mail-qt1-f199.google.com with SMTP id x10so9560734qtp.18
 for <nouveau@lists.freedesktop.org>; Mon, 07 Sep 2020 16:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=110Unz5qrB7/Ny3qdZoUTzTeS4D4CUQMCdJdAAxtNLA=;
 b=tiHYXscHaw11AuTSt2SXgmBSYSVu/l0WXftgzy2AViPt2xt6Q1op8WV04+YhzDGOK+
 Mg7THAbY6/5t2FzecGwCy7Mzhdc4l6+ae0CvNSmnY5de+L6XZH2coqgIDmL0/13iC98L
 +jrVSKD/ZnKO63qDaJcugKkHOxpEewW2z2WBcgd73c4U9pRJp79Vg0TiYLBhLXKdkECt
 A3ffSxbBG1rKF6bBaX6nlZhTUDJ/KhyqZhKgyA2t0J7AkiB9CrPB2oTawjz82InQ6LDs
 3OPeRAW5jaC9D5h2NFXlg2pAYnxzdUt5KbKJ/nbAddE/RyHN238cxa1ciGKcNb4x2Eu0
 Xxzg==
X-Gm-Message-State: AOAM5307OM3qsF3/8Ob3NH4XpERhEAn5HwuCAQHqj6iWZXnYN9mD1efC
 wXp3GvE9drzUODWX9Rs7sbVy1TgoK2Tl3MHzLtd1EpPDJEmBfI2y+W2MbymBVqfYhvWVvB7ib2P
 rLSf/sAijH57CM+e42IpG+mpukDGiZ8SRsA10aItBFw==
X-Received: by 2002:a37:7946:: with SMTP id u67mr7195210qkc.381.1599522690932; 
 Mon, 07 Sep 2020 16:51:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNp1vyx+UMls6RiqiVtY6OLWMPv0NBi3aWK5APkBWIwEoNwsPUDgrDTzN69CNanyWRznVbS/r4JAoisbk4Dog=
X-Received: by 2002:a37:7946:: with SMTP id u67mr7195180qkc.381.1599522690419; 
 Mon, 07 Sep 2020 16:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191004123947.11087-1-mika.westerberg@linux.intel.com>
 <20191004123947.11087-2-mika.westerberg@linux.intel.com>
 <20200808202202.GA12007@merlins.org>
 <20200906181852.GC13955@merlins.org>
 <CACO55tsodfUGVUjFw9=smFOhp_oXP8zWY_9+vL+iiPZhKJdtyg@mail.gmail.com>
 <20200907205825.GB20064@merlins.org>
In-Reply-To: <20200907205825.GB20064@merlins.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 8 Sep 2020 01:51:19 +0200
Message-ID: <CACO55ttBXKWTbxERK-aHsYQe_4=eK_WVc2+ebmCbCJJcQpFZrQ@mail.gmail.com>
To: Marc MERLIN <marc_nouveau@merlins.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] pcieport 0000:00:01.0: PME: Spurious native interrupt
 (nvidia with nouveau and thunderbolt on thinkpad P73)
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
Cc: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Sep 7, 2020 at 10:58 PM Marc MERLIN <marc_nouveau@merlins.org> wrote:
>
> On Mon, Sep 07, 2020 at 09:14:03PM +0200, Karol Herbst wrote:
> > > - changes in the nouveau driver. Mika told me the PCIe regression
> > >   "pcieport 0000:00:01.0: PME: Spurious native interrupt!" is supposed
> > >   to be fixed in 5.8, but I still get a 4mn hang or so during boot and
> > >   with 5.8, removing the USB key, didn't help make the boot faster
> >
> > that's the root port the GPU is attached to, no? I saw that message on
> > the Thinkpad P1G2 when runtime resuming the Nvidia GPU, but it does
> > seem to come from the root port.
>
> Hi Karol, thanks for your answer.
>
> 00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16) (rev 0d)
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
>
> > Well, you'd also need it when attaching external displays.
>
> Indeed. I just don't need that on this laptop, but familiar with the not
> so seemless procedure to turn on both GPUs, and mirror the intel one into
> the nvidia one for external output.
>
> > > [   11.262985] nvidia-gpu 0000:01:00.3: PME# enabled
> > > [   11.303060] nvidia-gpu 0000:01:00.3: PME# disabled
> >
> > mhh, interesting. I heard some random comments that the Nvidia
> > USB-C/UCSI driver is a bit broken and can cause various issues. Mind
> > blacklisting i2c-nvidia-gpu and typec_nvidia (and verify they don't
> > get loaded) and see if that helps?
>
> Right, this one:
> 01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU104 USB Type-C UCSI Controller (rev a1)
> Sure, I'll blacklist it. Ok, just did that, removed from initrd,
> rebooted, and it was no better.
>
> From initrd (before root gets mounted), I have this:
> nouveau              1961984  0
> mxm_wmi                16384  1 nouveau
> hwmon                  32768  1 nouveau
> ttm                   102400  1 nouveau
> wmi                    32768  2 nouveau,mxm_wmi
>
> I still got a 2mn hang. and a nouveau probe error
> [  189.124530] nouveau: probe of 0000:01:00.0 failed with error -12
>
>
> Here's what it looks like:
> [    9.693230] hid: raw HID events driver (C) Jiri Kosina
> [    9.694988] usbcore: registered new interface driver usbhid
> [    9.694989] usbhid: USB HID core driver
> [    9.696700] hid-generic 0003:1050:0200.0001: hiddev0,hidraw0: USB HID v1.00 Device [Yubico Yubico Gnubby (gnubby1)] on usb-0000:00:14.0-2/input0
> [    9.784456] Console: switching to colour frame buffer device 240x67
> [    9.816297] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
> [   25.087400] thunderbolt 0000:06:00.0: saving config space at offset 0x0 (reading 0x15eb8086)
> [   25.087414] thunderbolt 0000:06:00.0: saving config space at offset 0x4 (reading 0x100406)
> [   25.087419] thunderbolt 0000:06:00.0: saving config space at offset 0x8 (reading 0x8800006)
> [   25.087424] thunderbolt 0000:06:00.0: saving config space at offset 0xc (reading 0x20)
> [   25.087430] thunderbolt 0000:06:00.0: saving config space at offset 0x10 (reading 0xcc100000)
> [   25.087435] thunderbolt 0000:06:00.0: saving config space at offset 0x14 (reading 0xcc140000)
> [   25.087440] thunderbolt 0000:06:00.0: saving config space at offset 0x18 (reading 0x0)
> [   25.087445] thunderbolt 0000:06:00.0: saving config space at offset 0x1c (reading 0x0)
> [   25.087450] thunderbolt 0000:06:00.0: saving config space at offset 0x20 (reading 0x0)
> [   25.087455] thunderbolt 0000:06:00.0: saving config space at offset 0x24 (reading 0x0)
> [   25.087460] thunderbolt 0000:06:00.0: saving config space at offset 0x28 (reading 0x0)
> [   25.087466] thunderbolt 0000:06:00.0: saving config space at offset 0x2c (reading 0x229b17aa)
> [   25.087471] thunderbolt 0000:06:00.0: saving config space at offset 0x30 (reading 0x0)
> [   25.087476] thunderbolt 0000:06:00.0: saving config space at offset 0x34 (reading 0x80)
> [   25.087481] thunderbolt 0000:06:00.0: saving config space at offset 0x38 (reading 0x0)
> [   25.087486] thunderbolt 0000:06:00.0: saving config space at offset 0x3c (reading 0x1ff)
> [   25.087571] thunderbolt 0000:06:00.0: PME# enabled
> [   25.105353] pcieport 0000:05:00.0: saving config space at offset 0x0 (reading 0x15ea8086)
> [   25.105364] pcieport 0000:05:00.0: saving config space at offset 0x4 (reading 0x100407)
> [   25.105370] pcieport 0000:05:00.0: saving config space at offset 0x8 (reading 0x6040006)
> [   25.105375] pcieport 0000:05:00.0: saving config space at offset 0xc (reading 0x10020)
> [   25.105380] pcieport 0000:05:00.0: saving config space at offset 0x10 (reading 0x0)
> [   25.105384] pcieport 0000:05:00.0: saving config space at offset 0x14 (reading 0x0)
> [   25.105389] pcieport 0000:05:00.0: saving config space at offset 0x18 (reading 0x60605)
> [   25.105394] pcieport 0000:05:00.0: saving config space at offset 0x1c (reading 0x1f1)
> [   25.105399] pcieport 0000:05:00.0: saving config space at offset 0x20 (reading 0xcc10cc10)
> [   25.105404] pcieport 0000:05:00.0: saving config space at offset 0x24 (reading 0x1fff1)
> [   25.105409] pcieport 0000:05:00.0: saving config space at offset 0x28 (reading 0x0)
> [   25.105413] pcieport 0000:05:00.0: saving config space at offset 0x2c (reading 0x0)
> [   25.105418] pcieport 0000:05:00.0: saving config space at offset 0x30 (reading 0x0)
> [   25.105423] pcieport 0000:05:00.0: saving config space at offset 0x34 (reading 0x80)
> [   25.105428] pcieport 0000:05:00.0: saving config space at offset 0x38 (reading 0x0)
> [   25.105432] pcieport 0000:05:00.0: saving config space at offset 0x3c (reading 0x201ff)
> [   25.105517] pcieport 0000:05:00.0: PME# enabled
> [   25.125367] pcieport 0000:04:00.0: saving config space at offset 0x0 (reading 0x15ea8086)
> [   25.125378] pcieport 0000:04:00.0: saving config space at offset 0x4 (reading 0x100007)
> [   25.125383] pcieport 0000:04:00.0: saving config space at offset 0x8 (reading 0x6040006)
> [   25.125388] pcieport 0000:04:00.0: saving config space at offset 0xc (reading 0x10020)
> [   25.125393] pcieport 0000:04:00.0: saving config space at offset 0x10 (reading 0x0)
> [   25.125398] pcieport 0000:04:00.0: saving config space at offset 0x14 (reading 0x0)
> [   25.125403] pcieport 0000:04:00.0: saving config space at offset 0x18 (reading 0x510504)
> [   25.125407] pcieport 0000:04:00.0: saving config space at offset 0x1c (reading 0x5141)
> [   25.125412] pcieport 0000:04:00.0: saving config space at offset 0x20 (reading 0xcc10b400)
> [   25.125417] pcieport 0000:04:00.0: saving config space at offset 0x24 (reading 0x3ff10001)
> [   25.125422] pcieport 0000:04:00.0: saving config space at offset 0x28 (reading 0x60)
> [   25.125427] pcieport 0000:04:00.0: saving config space at offset 0x2c (reading 0x60)
> [   25.125431] pcieport 0000:04:00.0: saving config space at offset 0x30 (reading 0x0)
> [   25.125436] pcieport 0000:04:00.0: saving config space at offset 0x34 (reading 0x80)
> [   25.125441] pcieport 0000:04:00.0: saving config space at offset 0x38 (reading 0x0)
> [   25.125446] pcieport 0000:04:00.0: saving config space at offset 0x3c (reading 0x201ff)
> [   25.125528] pcieport 0000:04:00.0: PME# enabled
> [   25.145423] pcieport 0000:00:1c.0: saving config space at offset 0x0 (reading 0xa3388086)
> [   25.145437] pcieport 0000:00:1c.0: saving config space at offset 0x4 (reading 0x100407)
> [   25.145445] pcieport 0000:00:1c.0: saving config space at offset 0x8 (reading 0x60400f0)
> [   25.145453] pcieport 0000:00:1c.0: saving config space at offset 0xc (reading 0x810000)
> [   25.145460] pcieport 0000:00:1c.0: saving config space at offset 0x10 (reading 0x0)
> [   25.145464] pcieport 0000:00:1c.0: saving config space at offset 0x14 (reading 0x0)
> [   25.145469] pcieport 0000:00:1c.0: saving config space at offset 0x18 (reading 0x510400)
> [   25.145476] pcieport 0000:00:1c.0: saving config space at offset 0x1c (reading 0x20006040)
> [   25.145484] pcieport 0000:00:1c.0: saving config space at offset 0x20 (reading 0xcc10b400)
> [   25.145488] pcieport 0000:00:1c.0: saving config space at offset 0x24 (reading 0x3ff10001)
> [   25.145493] pcieport 0000:00:1c.0: saving config space at offset 0x28 (reading 0x60)
> [   25.145497] pcieport 0000:00:1c.0: saving config space at offset 0x2c (reading 0x60)
> [   25.145502] pcieport 0000:00:1c.0: saving config space at offset 0x30 (reading 0x0)
> [   25.145506] pcieport 0000:00:1c.0: saving config space at offset 0x34 (reading 0x40)
> [   25.145510] pcieport 0000:00:1c.0: saving config space at offset 0x38 (reading 0x0)
> [   25.145515] pcieport 0000:00:1c.0: saving config space at offset 0x3c (reading 0x201ff)
> [   25.145604] pcieport 0000:00:1c.0: PME# enabled
> [   26.265697] pcieport 0000:00:1c.0: power state changed by ACPI to D3cold
> [   45.468365] random: crng init done
> [  105.032727] usb 1-2: USB disconnect, device number 2  <= I removed a usb key, didn't help
> [  128.495144] async_tx: api initialized (async)
> [  128.514820] device-mapper: uevent: version 1.0.3
> [  128.518186] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
> [  144.869445] e1000e 0000:00:1f.6 eth0: NIC Link is Down
> [  172.851384] BTRFS: device label btrfs_pool4 devid 1 transid 78270 /dev/sdb4 scanned by btrfs (1293)
> [  172.851648] BTRFS: device label btrfs_pool3 devid 1 transid 27410 /dev/sda5 scanned by btrfs (1293)
> [  172.852030] BTRFS: device fsid de9694f8-9c0d-4e9d-bd12-57adc4381cd7 devid 1 transid 41 /dev/sda3 scanned by btrfs (1293)
> [  172.852224] BTRFS: device fsid 23e1398d-e462-41aa-b85e-f574906ddc03 devid 1 transid 585 /dev/nvme0n1p4 scanned by btrfs (1293)
> [  189.124291] nouveau 0000:01:00.0: disp ctor failed, -12
> [  189.124530] nouveau: probe of 0000:01:00.0 failed with error -12
>
> The next boot looks similar:
> [   25.161759] pcieport 0000:00:1c.0: PME# enabled
> [   26.297810] pcieport 0000:00:1c.0: power state changed by ACPI to D3cold
> [  128.427270] async_tx: api initialized (async)
> [  128.446525] device-mapper: uevent: version 1.0.3
> [  128.446691] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
> [  128.458120] random: cryptsetup: uninitialized urandom read (4 bytes read)
> [  138.507373] random: cryptsetup: uninitialized urandom read (4 bytes read)
> [  144.793573] e1000e 0000:00:1f.6 eth0: NIC Link is Down
> [  159.627780] random: crng init done
> [  171.814064] process '/usr/bin/fstype' started with executable stack
> [  181.949989] BTRFS: device label btrfs_boot devid 1 transid 394687 /dev/mapper/cryptroot scanned by btrfs (1063)
> [  181.953437] BTRFS: device label btrfs_pool4 devid 1 transid 78270 /dev/sdb4 scanned by btrfs (1063)
> [  181.956989] BTRFS: device label btrfs_pool3 devid 1 transid 27410 /dev/sda5 scanned by btrfs (1063)
> [  181.960473] BTRFS: device fsid de9694f8-9c0d-4e9d-bd12-57adc4381cd7 devid 1 transid 41 /dev/sda3 scanned by btrfs (1063)
> [  181.964097] BTRFS: device fsid 23e1398d-e462-41aa-b85e-f574906ddc03 devid 1 transid 585 /dev/nvme0n1p4 scanned by btrfs (1063)
> [  188.733645] nouveau 0000:01:00.0: disp ctor failed, -12
> [  188.740653] nouveau: probe of 0000:01:00.0 failed with error -12

oh, I somehow missed that "disp ctor failed" message. I think that
might explain why things are a bit hanging. From the top of my head I
am not sure if that's something known or something new. But just in
case I CCed Lyude and Ben. And I think booting with
nouveau.debug=disp=trace could already show something relevant.

> [  188.901070] PM: Image not found (code -22)
>
> Does that help?
>
> Thanks,
> Marc
> --
> "A mouse is a device used to point at the xterm you want to type in" - A.S.R.
>
> Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
