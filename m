Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25468B18721
	for <lists+nouveau@lfdr.de>; Fri,  1 Aug 2025 20:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1A210E30B;
	Fri,  1 Aug 2025 18:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.b="PwFQI/ZF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Fri, 01 Aug 2025 18:06:36 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B0B10E30B
 for <nouveau@lists.freedesktop.org>; Fri,  1 Aug 2025 18:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1754071594; x=1754676394; i=efault@gmx.de;
 bh=8h2BaQN1GxXOMnJa55qRgY3CSQwptiDBALzWv337c6Q=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Date:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PwFQI/ZFLMKpoDtxB7+vTf/d4RnGQT2WY/AEgfUfbQ7NH/yvVI4IX9c2O01u9N89
 gkFoE06MU1nwFMZ5yr7bROPX0LC+EVgxv9+El+GjqLjBP9FVJNAQmpmdlKsPlT0AQ
 PumFZqrwSgEIDnzeEntWq35ky0SDLy+QOqTPMNbvZDaMHg+qawXh6doduGSLls+PX
 AJhAN2gm2/lnaX9gIDqF25mGjd9S3xH7V8FuqpnnT71/r1esRDHI88Hczi2VTgFpW
 kQQl74g4CRXfAgNFOmeljV37M4gTbBVo7Z2Ytxq0CVRpdJKHflgIShh9gSVH0wNFo
 Fuf0K4UXAB7FDv7VOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([185.146.50.25]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYqp-1uOb3x0Ywt-00wr6C; Fri, 01
 Aug 2025 20:01:06 +0200
Message-ID: <709adaad09aeebca8b9c152075056ec5aad69a1f.camel@gmx.de>
Subject: nouveau: fbdev: Failed to setup emulation (ret=-22) - bisected to
 41ab92d35ccd
From: Mike Galbraith <efault@gmx.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, nouveau
 <nouveau@lists.freedesktop.org>
Autocrypt: addr=efault@gmx.de;
 keydata=mQGiBE/h0fkRBACJWa+2g5r12ej5DQZEpm0cgmzjpwc9mo6Jz7PFSkDQGeNG8wGwFzFPKQrLk1JRdqNSq37FgtFDDYlYOzVyO/6rKp0Iar2Oel4tbzlUewaYWUWTTAtJoTC0vf4p9Aybyo9wjor+XNvPehtdiPvCWdONKZuGJHKFpemjXXj7lb9ifwCg7PLKdz/VMBFlvbIEDsweR0olMykD/0uSutpvD3tcTItitX230Z849Wue3cA1wsOFD3N6uTg3GmDZDz7IZF+jJ0kKt9xL8AedZGMHPmYNWD3Hwh2gxLjendZlcakFfCizgjLZF3O7k/xIj7Hr7YqBSUj5Whkbrn06CqXSRE0oCsA/rBitUHGAPguJfgETbtDNqx8RYJA2A/9PnmyAoqH33hMYO+k8pafEgXUXwxWbhx2hlWEgwFovcBPLtukH6mMVKXS4iik9obfPEKLwW1mmz0eoHzbNE3tS1AaagHDhOqnSMGDOjogsUACZjCJEe1ET4JHZWFM7iszyolEhuHbnz2ajwLL9Ge8uJrLATreszJd57u+NhAyEW7QeTWlrZSBHYWxicmFpdGggPGVmYXVsdEBnbXguZGU+iGIEExECACIFAk/h0fkCGyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEMYmACnGfbb41A4AnjscsLm5ep+DSi7Bv8BmmoBGTCRnAJ9oXX0KtnBDttPkgUbaiDX56Z1+crkBDQRP4dH5EAQAtYCgoXJvq8VqoleWvqcNScHLrN4LkFxfGkDdqTyQe/79rDWr8su+8TH1ATZ/k+lC6W+vg7ygrdyOK7egA5u+T/GBA1VN+KqcqGqAEZqCLvjorKVQ6mgb5FfXouSGvtsblbRMireEEhJqIQPndq3DvZbKXHVkKrUBcco4MMGDVucABAsEAKXKCwGVEVuYcM/KdT2htDpziRH4JfUn3Ts2EC6F7rXIQ4NaIA6gAvL6HdD3q
 y6yrWaxyqUg8CnZF/J5HR+IvRK+vu85xxwSLQsrVONH0Ita1jg2nhUW7yLZer8xrhxIuYCqrMgreo5BAA3+irHy37rmqiAFZcnDnCNDtJ4sz48tiEkEGBECAAkFAk/h0fkCGwwACgkQxiYAKcZ9tvgIMQCeIcgjSxwbGiGn2q/cv8IvHf1r/DIAnivw+bGITqTU7rhgfwe07dhBoIdz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Fri, 01 Aug 2025 19:55:15 +0200
User-Agent: Evolution 3.50.3 
X-Provags-ID: V03:K1:1klbGHtdw1HnkknE9uyKOl3gSfzx2uZSnxVqui2sBalfRCiDiLh
 KLkdtIDApbCnN36Ccaao/IjjvAz6n+SWmwcLGBGGsZvVYpTQpMuFT0SW7dAUTfibtqKFBd5
 pAVGYHZdzfJOefMo7PSxHHIk41BV7kyMC1kaYhaPBTUr2tYnMJZUZTa8PbnMuDDOdwA2Klr
 YugEjLL7mgoiiwStqbndA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mz0tHFTkjjg=;pm37Xexxw/AKjEvV55+peG0eJQ1
 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
 0reg9RBfu3MCtiG4tK39i2c=
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

Greetings,

Reverting the fingered commit below brought my GTX980 back to life.

41ab92d35ccd2d66bfb049bd34cd95f0304b0240 is the first bad commit
commit 41ab92d35ccd2d66bfb049bd34cd95f0304b0240
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Date:   Tue Jul 1 12:07:22 2025 +0300

    drm: Make passing of format info to drm_helper_mode_fill_fb_struct() ma=
ndatory
   =20
    Now that everyone passes along the format info to
    drm_helper_mode_fill_fb_struct() we can make this behaviour
    mandatory and drop the extra lookup.
   =20
    Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
    Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20250701090722.1364=
5-20-ville.syrjala@linux.intel.com

 drivers/gpu/drm/drm_modeset_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

dmesg output sans revert:
[    3.220788] nouveau 0000:01:00.0: NVIDIA GM204 (124000a1)
[    3.302724] nouveau 0000:01:00.0: bios: version 84.04.1f.00.02
[    3.304609] nouveau 0000:01:00.0: pmu: firmware unavailable
[    3.308652] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    3.308905] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    3.308920] nouveau 0000:01:00.0: bus: MMIO write of 80000195 FAULT at 1=
0eb14 [ PRIVRING ]
[    3.375764] nouveau 0000:01:00.0: drm: VRAM: 4096 MiB
[    3.375768] nouveau 0000:01:00.0: drm: GART: 1048576 MiB
[    3.375771] nouveau 0000:01:00.0: drm: TMDS table version 2.0
[    3.376933] nouveau 0000:01:00.0: drm: MM: using COPY for buffer copies
[    3.425989] [drm] Initialized nouveau 1.4.0 for 0000:01:00.0 on minor 0
[    3.459953] Modules linked in: hid_generic(+) usbhid nouveau(+) drm_ttm_=
helper ttm drm_client_lib gpu_sched i2c_algo_bit drm_gpuvm drm_exec drm_dis=
play_helper drm_kms_helper xhci_pci drm ehci_pci xhci_hcd ehci_hcd ahci lib=
ahci libata ghash_clmulni_intel usbcore video wmi button usb_common sd_mod =
scsi_dh_emc scsi_dh_rdac scsi_dh_alua sg scsi_mod scsi_common vfat fat ext4=
 crc16 mbcache jbd2 loop msr efivarfs autofs4 aesni_intel gf128mul
[    3.460023]  nouveau_framebuffer_new+0x27f/0x470 [nouveau]
[    3.460116]  nouveau_user_framebuffer_create+0x42/0x90 [nouveau]
[    3.460289]  nouveau_drm_probe+0x128/0x1a0 [nouveau]
[    3.460402]  nouveau_drm_init+0x8b/0x1000 [nouveau]
[    3.460516] nouveau 0000:01:00.0: [drm] *ERROR* fbdev: Failed to setup e=
mulation (ret=3D-22)
[    3.494950] nouveau 0000:01:00.0: [drm] *ERROR* fbdev: Failed to setup e=
mulation (ret=3D-22)
[   19.217424] nouveau 0000:01:00.0: [drm] *ERROR* crtc 66: Can't calculate=
 constants, dotclock =3D 0!
[   19.217438] nouveau 0000:01:00.0: [drm] drm_WARN_ON_ONCE(drm_drv_uses_at=
omic_modeset(dev))
[   19.217504] Modules linked in: af_packet nft_fib_inet nft_fib_ipv4 nft_f=
ib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tab=
les bridge stp llc iscsi_ibft iscsi_boot_sysfs rfkill nfnetlink binfmt_misc=
 usblp joydev nls_iso8859_1 nls_cp437 intel_rapl_msr intel_rapl_common x86_=
pkg_temp_thermal intel_powerclamp coretemp snd_hda_codec_generic snd_hda_co=
dec_hdmi kvm_intel snd_hda_intel r8169 iTCO_wdt snd_intel_dspcfg snd_hda_co=
dec uas at24 realtek intel_pmc_bxt snd_hwdep kvm usb_storage regmap_i2c snd=
_hda_core mei_hdcp iTCO_vendor_support mdio_devres snd_pcm libphy irqbypass=
 i2c_i801 snd_timer pcspkr i2c_smbus mei_me snd mdio_bus mei lpc_ich soundc=
ore mfd_core thermal fan intel_smartconnect nfsd auth_rpcgss nfs_acl lockd =
grace sch_fq_codel sunrpc fuse configfs dmi_sysfs hid_generic usbhid nouvea=
u drm_ttm_helper ttm drm_client_lib gpu_sched i2c_algo_bit drm_gpuvm drm_ex=
ec drm_display_helper drm_kms_helper xhci_pci drm ehci_pci
[   19.217694]  nv50_disp_atomic_commit_tail+0x2a1/0x740 [nouveau]
[   19.217761]  nv50_disp_atomic_commit.part.0+0x1a2/0x1d0 [nouveau]
[   19.217960]  nouveau_drm_ioctl+0x56/0xb0 [nouveau]
[   19.218082] nouveau 0000:01:00.0: [drm] *ERROR* crtc 66: Can't calculate=
 constants, dotclock =3D 0!
<repeats elided>

dmesg output with revert:
[    3.223553] nouveau 0000:01:00.0: NVIDIA GM204 (124000a1)
[    3.304520] nouveau 0000:01:00.0: bios: version 84.04.1f.00.02
[    3.306489] nouveau 0000:01:00.0: pmu: firmware unavailable
[    3.310543] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    3.310789] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    3.310815] nouveau 0000:01:00.0: bus: MMIO write of 800001a8 FAULT at 1=
0eb14 [ PRIVRING ]
[    3.377610] nouveau 0000:01:00.0: drm: VRAM: 4096 MiB
[    3.377614] nouveau 0000:01:00.0: drm: GART: 1048576 MiB
[    3.377616] nouveau 0000:01:00.0: drm: TMDS table version 2.0
[    3.378810] nouveau 0000:01:00.0: drm: MM: using COPY for buffer copies
[    3.419667] [drm] Initialized nouveau 1.4.0 for 0000:01:00.0 on minor 0
[    3.454261] fbcon: nouveaudrmfb (fb0) is primary device
[    3.498407] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer d=
evice

=20
