Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF2415F35
	for <lists+nouveau@lfdr.de>; Thu, 23 Sep 2021 15:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EA26ED12;
	Thu, 23 Sep 2021 13:08:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6174B6ED12
 for <nouveau@lists.freedesktop.org>; Thu, 23 Sep 2021 13:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632402484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COif2QJohR1HEgeovvAC9V/4lLij+eNLZ2w4W0TLC1Q=;
 b=bKNbd2AHS6jFndBmJfYB5q5kSjYIPPpIqkolYMDGWjBX12p9ff20QkjPiNcy3gJS0d63pT
 IKPQ6BzCRn9+i/phC50FJpSsErHBQYB7zEVx/P86yaGcKc1iVZsBc0bmRYbHeHVx2yt/Po
 kCHrfOcYoQmO62W2weGZjRFMZw5Tf5k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-JtHHjbPLM_qPXcC-CJKb9Q-1; Thu, 23 Sep 2021 09:08:00 -0400
X-MC-Unique: JtHHjbPLM_qPXcC-CJKb9Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adff68f000000b0015df51efa18so5059737wrp.16
 for <nouveau@lists.freedesktop.org>; Thu, 23 Sep 2021 06:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=COif2QJohR1HEgeovvAC9V/4lLij+eNLZ2w4W0TLC1Q=;
 b=yBZNoSMPnaoIn2zNfnHJprcS7qn2v1FoOR9a9wCR2oPhaB2OLvjzMezut7YeD6d4C+
 F0Vrhrbd00vOmmSx4AvDQWML1KnAWnCSBQopN0SQBGqBgFmJYImgW6W2KR5H/HbEB8tH
 M/RTt6wK8R36Z1Ba81L5rV6ToA2XBodB0Ig14KvUZRYmNJRpA1DhUp9vc9Eb/tGWOacn
 wGm3KYY2djhL0ZWOZS9d0NPthwgyuFnvt2vgygacDDFDtHVT5KHuohq1vbi8/EQxg2kl
 qT3wWiixc+pUJcGETA0OJ/Ag4A/zLFaBM6OITihPl+oU8A4MCLy4ZxMcdPnqO6rxZldH
 8PWA==
X-Gm-Message-State: AOAM533J7l589IcMwDlcpCKbky9d3lCF+1pDPpPQg560xVU27ZeXtKk+
 y25WL8djnEwkmwhTWphUyQTMejuxOvIMk3y+ygQte4R6q+m5vFicSWv+PsNy2mcaBFenprNb7Jj
 aB9h1dL1DNbBJwsKYPZPlTexC4w2J7x4cPrQRPU2+9w==
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr5076005wrs.11.1632402477302;
 Thu, 23 Sep 2021 06:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzFgPZruCmnQYR5I6fmy7J+fiv4Kn+K/LWrn22kvpNFj3pYHkLOzuf4F5vjJ1xaznYxJ16259gMT4JrLj17UI=
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr5075860wrs.11.1632402475964;
 Thu, 23 Sep 2021 06:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <211811631197764@mail.yandex.ru>
In-Reply-To: <211811631197764@mail.yandex.ru>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 23 Sep 2021 15:07:44 +0200
Message-ID: <CACO55ttxkEt=uSvfkoWyHDzzVE+8+BrMX5p91C3-S9Om99y3-Q@mail.gmail.com>
To: Piro <startbase@yandex.ru>
Cc: "nouveau@lists.freedesktop.org." <nouveau@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] external monitor does not work
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

sorry for the late answer. I think booting with "nouveau.runpm=3D0" will
solve this problem, but then it causes the GPU to be always powered
on. I suspect that the kernel doesn't detect hotplug events later on
and I am sure this is solved with newer kernel versions. We solved
issues like this in the best, so trying out 5.14 or 5.15 would be most
appreciated.

On Fri, Sep 10, 2021 at 8:46 PM Piro <startbase@yandex.ru> wrote:
>
> Hello,
>
> I am the owner of a laptop "ACER nitro 5"
> I i installed a "parrot os" operating system. I know that is better to us=
e it on virtual machines,
>  but I need it  installed. I have an external monitor(monitor and all cab=
les are completely new,
>  before i had a different monitor and there was a completely similar prob=
lem)
>  which is connected via HDMI to my laptop.
>
>  My problem:
>  the monitor that is connected via HDMI works only for the first few seco=
nds when the operating system boots, after that it just stays black. I real=
ly like your product because only with your drivers hashcat works for me
>
>
>
>
> uname -a
>
> Linux pc 5.10.0-8parrot1-amd64 #1 SMP Debian 5.10.46-8parrot1 (2021-07-21=
) x86_64 GNU/Linux
>
>
> apt search nouveau
>
> Sorting... Done
> Full Text Search... Done
> bumblebee/rolling 3.2.1-27 amd64
>   NVIDIA Optimus support for Linux
>
> libdrm-nouveau2/rolling,now 2.4.104-1 amd64 [installed,automatic]
>   Userspace interface to nouveau-specific kernel DRM services -- runtime
>
> xfonts-jmk/rolling 3.0-23 all
>   Jim Knoble's character-cell fonts for X
>
> xserver-xorg-video-nouveau/rolling,now 1:1.0.17-1 amd64 [installed,automa=
tic]
>   X.Org X server -- Nouveau display driver
>
>
> xrandr -q:
> Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
> eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis =
y axis) 344mm x 193mm
>    1920x1080     60.05*+  60.01    59.97    59.96    59.93
>    1680x1050     59.95    59.88
>    1600x1024     60.17
>    1400x1050     59.98
>    1600x900      59.99    59.94    59.95    59.82
>    1280x1024     60.02
>    1440x900      59.89
>    1400x900      59.96    59.88
>    1280x960      60.00
>    1440x810      60.00    59.97
>    1368x768      59.88    59.85
>    1360x768      59.80    59.96
>    1280x800      59.99    59.97    59.81    59.91
>    1152x864      60.00
>    1280x720      60.00    59.99    59.86    59.74
>    1024x768      60.04    60.00
>    960x720       60.00
>    928x696       60.05
>    896x672       60.01
>    1024x576      59.95    59.96    59.90    59.82
>    960x600       59.93    60.00
>    960x540       59.96    59.99    59.63    59.82
>    800x600       60.00    60.32    56.25
>    840x525       60.01    59.88
>    864x486       59.92    59.57
>    800x512       60.17
>    700x525       59.98
>    800x450       59.95    59.82
>    640x512       60.02
>    720x450       59.89
>    700x450       59.96    59.88
>    640x480       60.00    59.94
>    720x405       59.51    58.99
>    684x384       59.88    59.85
>    680x384       59.80    59.96
>    640x400       59.88    59.98
>    576x432       60.06
>    640x360       59.86    59.83    59.84    59.32
>    512x384       60.00
>    512x288       60.00    59.92
>    480x270       59.63    59.82
>    400x300       60.32    56.34
>    432x243       59.92    59.57
>    320x240       60.05
>    360x202       59.51    59.13
>    320x180       59.84    59.32
>
>
> xrandr --current | grep " connected"
> eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis =
y axis) 344mm x 193mm
>
>
> xrandr --listproviders
> Providers: number : 2
> Provider 0: id: 0x43 cap: 0xf, Source Output, Sink Output, Source Offload=
, Sink Offload crtcs: 3 outputs: 1 associated providers: 0 name:modesetting
> Provider 1: id: 0xd4 cap: 0xf, Source Output, Sink Output, Source Offload=
, Sink Offload crtcs: 4 outputs: 1 associated providers: 0 name:modesetting
>
>
>
> lsmod
> Module                  Size  Used by
> udp_diag               16384  0
> rfcomm                 90112  16
> tcp_diag               16384  0
> inet_diag              24576  2 tcp_diag,udp_diag
> nft_counter            16384  8
> nfnetlink_queue        28672  1
> xt_conntrack           16384  2
> nf_conntrack          176128  1 xt_conntrack
> nf_defrag_ipv6         24576  1 nf_conntrack
> nf_defrag_ipv4         16384  1 nf_conntrack
> ctr                    16384  0
> ccm                    20480  0
> xt_NFQUEUE             16384  4
> xt_tcpudp              20480  2
> intel_rapl_msr         20480  0
> nft_compat             20480  8
> intel_rapl_common      28672  1 intel_rapl_msr
> nf_tables             245760  14 nft_compat,nft_counter
> cmac                   16384  2
> nfnetlink              16384  4 nfnetlink_queue,nft_compat,nf_tables
> algif_hash             16384  1
> algif_skcipher         16384  1
> af_alg                 32768  6 algif_hash,algif_skcipher
> xfrm_user              45056  2
> bnep                   28672  2
> xfrm_algo              16384  1 xfrm_user
> mei_hdcp               24576  0
> snd_sof_pci            24576  0
> snd_sof_intel_byt      24576  1 snd_sof_pci
> snd_sof_intel_ipc      20480  1 snd_sof_intel_byt
> snd_sof_intel_hda_common   102400  1 snd_sof_pci
> snd_sof_xtensa_dsp     16384  2 snd_sof_intel_hda_common,snd_sof_intel_by=
t
> binfmt_misc            24576  1
> snd_sof               139264  4 snd_sof_pci,snd_sof_intel_hda_common,snd_=
sof_intel_byt,snd_sof_intel_ipc
> snd_sof_intel_hda      20480  1 snd_sof_intel_hda_common
> x86_pkg_temp_thermal    20480  0
> intel_powerclamp       20480  0
> snd_soc_skl           180224  0
> snd_soc_hdac_hda       24576  2 snd_sof_intel_hda_common,snd_soc_skl
> coretemp               20480  0
> snd_hda_ext_core       36864  4 snd_sof_intel_hda_common,snd_soc_hdac_hda=
,snd_soc_skl,snd_sof_intel_hda
> snd_hda_codec_realtek   151552  1
> snd_soc_sst_ipc        20480  1 snd_soc_skl
> nls_cp437              20480  1
> snd_soc_sst_dsp        36864  1 snd_soc_skl
> snd_hda_codec_generic    98304  1 snd_hda_codec_realtek
> btusb                  65536  0
> kvm_intel             327680  0
> snd_soc_acpi_intel_match    45056  3 snd_sof_pci,snd_sof_intel_hda_common=
,snd_soc_skl
> btrtl                  24576  1 btusb
> vfat                   20480  1
> ledtrig_audio          16384  2 snd_hda_codec_generic,snd_sof
> snd_hda_codec_hdmi     73728  1
> btbcm                  20480  1 btusb
> fat                    86016  1 vfat
> snd_soc_acpi           16384  4 snd_soc_acpi_intel_match,snd_sof_intel_hd=
a_common,snd_sof_intel_byt,snd_soc_skl
> btintel                32768  1 btusb
> iwlmvm                339968  0
> snd_hda_intel          57344  4
> kvm                   917504  1 kvm_intel
> bluetooth             737280  43 btrtl,btintel,btbcm,bnep,btusb,rfcomm
> snd_intel_dspcfg       28672  4 snd_hda_intel,snd_sof_pci,snd_sof_intel_h=
da_common,snd_soc_skl
> irqbypass              16384  1 kvm
> soundwire_intel        45056  2 snd_sof_intel_hda_common,snd_intel_dspcfg
> wl                   6471680  0
> soundwire_generic_allocation    16384  1 soundwire_intel
> rapl                   20480  0
> snd_soc_core          315392  5 soundwire_intel,snd_sof,snd_sof_intel_hda=
_common,snd_soc_hdac_hda,snd_soc_skl
> mac80211              983040  1 iwlmvm
> snd_compress           32768  1 snd_soc_core
> libarc4                16384  1 mac80211
> intel_cstate           20480  0
> soundwire_cadence      36864  1 soundwire_intel
> jitterentropy_rng      16384  1
> uvcvideo              114688  0
> iwlwifi               294912  1 iwlmvm
> intel_uncore          176128  0
> snd_hda_codec         172032  5 snd_hda_codec_generic,snd_hda_codec_hdmi,=
snd_hda_intel,snd_hda_codec_realtek,snd_soc_hdac_hda
> videobuf2_vmalloc      20480  1 uvcvideo
> videobuf2_memops       20480  1 videobuf2_vmalloc
> snd_hda_core          110592  10 snd_hda_codec_generic,snd_hda_codec_hdmi=
,snd_hda_intel,snd_hda_ext_core,snd_hda_codec,snd_hda_codec_realtek,snd_sof=
_intel_hda_common,snd_soc_hdac_hda,snd_soc_skl,snd_sof_intel_hda
> videobuf2_v4l2         36864  1 uvcvideo
> drbg                   40960  1
> iTCO_wdt               16384  0
> snd_hwdep              16384  1 snd_hda_codec
> videobuf2_common       65536  2 videobuf2_v4l2,uvcvideo
> serio_raw              20480  0
> intel_wmi_thunderbolt    20480  0
> soundwire_bus          90112  3 soundwire_intel,soundwire_generic_allocat=
ion,soundwire_cadence
> acer_wmi               28672  0
> intel_pmc_bxt          16384  1 iTCO_wdt
> pcspkr                 16384  0
> efi_pstore             16384  0
> sparse_keymap          16384  1 acer_wmi
> wmi_bmof               16384  0
> videodev              286720  3 videobuf2_v4l2,uvcvideo,videobuf2_common
> ee1004                 20480  0
> ansi_cprng             16384  0
> snd_pcm               135168  10 snd_hda_codec_hdmi,snd_hda_intel,snd_hda=
_codec,soundwire_intel,snd_sof,snd_sof_intel_hda_common,snd_compress,snd_so=
c_core,snd_soc_skl,snd_hda_core
> iTCO_vendor_support    16384  1 iTCO_wdt
> snd_timer              49152  1 snd_pcm
> cfg80211              970752  4 wl,iwlmvm,iwlwifi,mac80211
> mei_me                 45056  1
> joydev                 28672  0
> ecdh_generic           16384  1 bluetooth
> snd                   110592  18 snd_hda_codec_generic,snd_hda_codec_hdmi=
,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek,snd_timer,snd_=
compress,snd_soc_core,snd_pcm
> watchdog               28672  1 iTCO_wdt
> mc                     61440  4 videodev,videobuf2_v4l2,uvcvideo,videobuf=
2_common
> hid_multitouch         32768  0
> sg                     36864  0
> ecc                    36864  1 ecdh_generic
> mei                   139264  3 mei_hdcp,mei_me
> rfkill                 28672  10 acer_wmi,bluetooth,cfg80211
> soundcore              16384  1 snd
> intel_pch_thermal      16384  0
> ac                     16384  0
> tpm_crb                20480  0
> tpm_tis                16384  0
> tpm_tis_core           28672  1 tpm_tis
> tpm                    73728  3 tpm_tis,tpm_crb,tpm_tis_core
> rng_core               16384  2 tpm
> evdev                  28672  29
> intel_pmc_core         45056  0
> acer_wireless          20480  0
> acpi_pad              184320  0
> parport_pc             40960  0
> ppdev                  24576  0
> lp                     20480  0
> parport                69632  3 parport_pc,lp,ppdev
> fuse                  167936  3
> configfs               57344  1
> efivarfs               16384  1
> ip_tables              32768  0
> x_tables               53248  5 xt_conntrack,nft_compat,xt_tcpudp,ip_tabl=
es,xt_NFQUEUE
> autofs4                53248  2
> raid10                 65536  0
> raid456               180224  0
> async_raid6_recov      24576  1 raid456
> async_memcpy           20480  2 raid456,async_raid6_recov
> async_pq               20480  2 raid456,async_raid6_recov
> async_xor              20480  3 async_pq,raid456,async_raid6_recov
> async_tx               20480  5 async_pq,async_memcpy,async_xor,raid456,a=
sync_raid6_recov
> raid1                  53248  0
> raid0                  24576  0
> multipath              20480  0
> linear                 20480  0
> md_mod                184320  6 raid1,raid10,raid0,linear,raid456,multipa=
th
> xfs                  1773568  0
> btrfs                1564672  1
> blake2b_generic        20480  0
> xor                    24576  2 async_xor,btrfs
> raid6_pq              122880  4 async_pq,btrfs,raid456,async_raid6_recov
> libcrc32c              16384  5 nf_conntrack,btrfs,nf_tables,xfs,raid456
> ext4                  921600  0
> crc16                  16384  2 bluetooth,ext4
> mbcache                16384  1 ext4
> jbd2                  151552  1 ext4
> crc32c_generic         16384  0
> nls_ascii              16384  1
> uas                    32768  0
> usb_storage            81920  1 uas
> usbhid                 65536  0
> sd_mod                 61440  0
> hid_generic            16384  0
> crc32_pclmul           16384  0
> crc32c_intel           24576  2
> ghash_clmulni_intel    16384  0
> rtsx_pci_sdmmc         32768  0
> nouveau              2326528  1
> mmc_core              188416  1 rtsx_pci_sdmmc
> i915                 2715648  17
> nvme                   49152  2
> mxm_wmi                16384  1 nouveau
> ttm                   114688  1 nouveau
> i2c_algo_bit           16384  2 i915,nouveau
> xhci_pci               20480  0
> aesni_intel           368640  3
> nvme_core             126976  4 nvme
> r8169                 102400  0
> ahci                   40960  0
> libaes                 16384  2 bluetooth,aesni_intel
> drm_kms_helper        274432  2 i915,nouveau
> libahci                45056  1 ahci
> crypto_simd            16384  1 aesni_intel
> xhci_hcd              307200  1 xhci_pci
> realtek                24576  1
> t10_pi                 16384  2 sd_mod,nvme_core
> cec                    61440  2 drm_kms_helper,i915
> cryptd                 24576  3 crypto_simd,ghash_clmulni_intel
> glue_helper            16384  1 aesni_intel
> mdio_devres            16384  1 r8169
> libata                290816  2 libahci,ahci
> crc_t10dif             20480  1 t10_pi
> crct10dif_generic      16384  0
> i2c_i801               32768  0
> crct10dif_pclmul       16384  1
> i2c_smbus              20480  1 i2c_i801
> libphy                151552  3 r8169,mdio_devres,realtek
> rtsx_pci              106496  1 rtsx_pci_sdmmc
> crct10dif_common       16384  3 crct10dif_generic,crc_t10dif,crct10dif_pc=
lmul
> intel_lpss_pci         24576  0
> usbcore               323584  7 xhci_hcd,usbhid,usb_storage,uvcvideo,btus=
b,xhci_pci,uas
> scsi_mod              262144  5 sd_mod,usb_storage,uas,libata,sg
> intel_lpss             16384  1 intel_lpss_pci
> drm                   618496  9 drm_kms_helper,i915,ttm,nouveau
> idma64                 20480  0
> usb_common             16384  3 xhci_hcd,usbcore,uvcvideo
> i2c_hid                32768  0
> hid                   147456  4 i2c_hid,usbhid,hid_multitouch,hid_generic
> battery                20480  0
> wmi                    36864  5 intel_wmi_thunderbolt,acer_wmi,wmi_bmof,m=
xm_wmi,nouveau
> video                  53248  3 acer_wmi,i915,nouveau
> button                 24576  1 nouveau
>
>
> cat /usr/share/doc/xserver-xorg-video-intel/xorg.conf
> Section "Device"
>     Identifier "Intel"
>     Driver "intel"
> #    Option "AccelMethod" "uxa"
> EndSection
>
>
>
> dmesg
>
> [    0.000000] microcode: microcode updated early to revision 0xea, date =
=3D 2021-01-05
> [    0.000000] Linux version 5.10.0-8parrot1-amd64 (team@parrotsec.org) (=
gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) =
2.35.2) #1 SMP Debian 5.10.46-8parrot1 (2021-07-21)
> [    0.000000] Command line: BOOT_IMAGE=3D/@/boot/vmlinuz-5.10.0-8parrot1=
-amd64 root=3DUUID=3Defd4b6b0-1a18-466d-b365-d62deb587b54 ro rootflags=3Dsu=
bvol=3D@ quiet splash noautomount quiet splash
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poi=
nt registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds regis=
ters'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
> [    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
> [    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960=
 bytes, using 'compacted' format.
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000071896fff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000071897000-0x0000000072996fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000072997000-0x0000000088badfff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000088bae000-0x0000000088dadfff] typ=
e 20
> [    0.000000] BIOS-e820: [mem 0x0000000088dae000-0x000000008959dfff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x000000008959e000-0x0000000089c8dfff] ACP=
I NVS
> [    0.000000] BIOS-e820: [mem 0x0000000089c8e000-0x0000000089d0dfff] ACP=
I data
> [    0.000000] BIOS-e820: [mem 0x0000000089d0e000-0x0000000089d0efff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000089d0f000-0x000000008f7fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000ff600000-0x00000000ffffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000046e7fffff] usa=
ble
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] efi: EFI v2.60 by INSYDE Corp.
> [    0.000000] efi: TPMFinalLog=3D0x89596000 ACPI 2.0=3D0x89d0d014 ESRT=
=3D0x88dce618 SMBIOS=3D0x88dca000 SMBIOS 3.0=3D0x88dc8000 MEMATTR=3D0x78f2d=
018
> [    0.000000] secureboot: Secure boot could not be determined (mode 0)
> [    0.000000] SMBIOS 3.0.1 present.
> [    0.000000] DMI: Acer Nitro AN515-52/Freed_CFS, BIOS V1.28 08/05/2019
> [    0.000000] tsc: Detected 2200.000 MHz processor
> [    0.000000] tsc: Detected 2199.996 MHz TSC
> [    0.000005] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000007] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000011] last_pfn =3D 0x46e800 max_arch_pfn =3D 0x400000000
> [    0.000013] MTRR default type: write-back
> [    0.000014] MTRR fixed ranges enabled:
> [    0.000015]   00000-9FFFF write-back
> [    0.000015]   A0000-BFFFF uncachable
> [    0.000016]   C0000-FFFFF write-protect
> [    0.000016] MTRR variable ranges enabled:
> [    0.000017]   0 base 00C0000000 mask 7FC0000000 uncachable
> [    0.000018]   1 base 00A0000000 mask 7FE0000000 uncachable
> [    0.000018]   2 base 0090000000 mask 7FF0000000 uncachable
> [    0.000019]   3 base 008C000000 mask 7FFC000000 uncachable
> [    0.000020]   4 base 008B000000 mask 7FFF000000 uncachable
> [    0.000020]   5 disabled
> [    0.000020]   6 disabled
> [    0.000021]   7 disabled
> [    0.000021]   8 disabled
> [    0.000021]   9 disabled
> [    0.000369] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- =
WT
> [    0.000618] last_pfn =3D 0x89d0f max_arch_pfn =3D 0x400000000
> [    0.005815] esrt: Reserving ESRT space from 0x0000000088dce618 to 0x00=
00000088dce650.
> [    0.005820] Using GB pages for direct mapping
> [    0.006199] RAMDISK: [mem 0x2e477000-0x33232fff]
> [    0.006202] ACPI: Early table checksum verification disabled
> [    0.006204] ACPI: RSDP 0x0000000089D0D014 000024 (v02 ACRSYS)
> [    0.006206] ACPI: XSDT 0x0000000089CED188 0000EC (v01 ACRSYS ACRPRDCT =
00000000      01000013)
> [    0.006210] ACPI: FACP 0x0000000089CF0000 00010C (v05 ACRSYS ACRPRDCT =
00000000 1025 00040000)
> [    0.006213] ACPI: DSDT 0x0000000089CB3000 0373CB (v02 ACRSYS ACRPRDCT =
00000000 1025 00040000)
> [    0.006215] ACPI: FACS 0x0000000089C0D000 000040
> [    0.006216] ACPI: UEFI 0x0000000089D0C000 000236 (v01 ACRSYS ACRPRDCT =
00000001 1025 00040000)
> [    0.006218] ACPI: SSDT 0x0000000089D0A000 0017D5 (v02 ACRSYS ACRPRDCT =
00003000 1025 00040000)
> [    0.006220] ACPI: SSDT 0x0000000089D06000 0031C7 (v02 ACRSYS ACRPRDCT =
00003000 1025 00040000)
> [    0.006222] ACPI: SSDT 0x0000000089D04000 001DC8 (v02 ACRSYS ACRPRDCT =
00001000 1025 00040000)
> [    0.006224] ACPI: UEFI 0x0000000089D03000 000042 (v01 ACRSYS ACRPRDCT =
00000002 1025 00040000)
> [    0.006225] ACPI: SSDT 0x0000000089D02000 00045A (v02 ACRSYS ACRPRDCT =
00001000 1025 00040000)
> [    0.006227] ACPI: SSDT 0x0000000089D01000 000046 (v02 ACRSYS ACRPRDCT =
00003000 1025 00040000)
> [    0.006229] ACPI: TPM2 0x0000000089D00000 000034 (v03 ACRSYS ACRPRDCT =
00000002 1025 00040000)
> [    0.006231] ACPI: LPIT 0x0000000089CFF000 00005C (v01 ACRSYS ACRPRDCT =
00000000 1025 00040000)
> [    0.006232] ACPI: WSMT 0x0000000089CFE000 000028 (v01 ACRSYS ACRPRDCT =
00000000 1025 00040000)
> [    0.006234] ACPI: SSDT 0x0000000089CFD000 000C2F (v02 ACRSYS ACRPRDCT =
00001000 1025 00040000)
> [    0.006236] ACPI: SSDT 0x0000000089CFC000 000FBB (v02 ACRSYS ACRPRDCT =
00000000 1025 00040000)
> [    0.006238] ACPI: DBGP 0x0000000089CFB000 000034 (v01 ACRSYS ACRPRDCT =
00000002 1025 00040000)
> [    0.006239] ACPI: DBG2 0x0000000089CFA000 000054 (v00 ACRSYS ACRPRDCT =
00000002 1025 00040000)
> [    0.006241] ACPI: SSDT 0x0000000089CF9000 000B74 (v02 ACRSYS ACRPRDCT =
00001000 1025 00040000)
> [    0.006243] ACPI: SSDT 0x0000000089CF3000 0058C1 (v01 ACRSYS ACRPRDCT =
00001000 1025 00040000)
> [    0.006245] ACPI: ASF! 0x0000000089CF1000 0000A5 (v32 ACRSYS ACRPRDCT =
00000001 1025 00040000)
> [    0.006246] ACPI: HPET 0x0000000089CEF000 000038 (v01 ACRSYS ACRPRDCT =
00000001 1025 00040000)
> [    0.006248] ACPI: APIC 0x0000000089CEE000 00012C (v03 ACRSYS ACRPRDCT =
00000001 1025 00040000)
> [    0.006250] ACPI: MCFG 0x0000000089CEC000 00003C (v01 ACRSYS ACRPRDCT =
00000001 1025 00040000)
> [    0.006252] ACPI: SSDT 0x0000000089CAE000 0044DC (v01 ACRSYS ACRPRDCT =
00001000 1025 00040000)
> [    0.006253] ACPI: DMAR 0x0000000089CEB000 0000A8 (v01 ACRSYS ACRPRDCT =
00000002 1025 00040000)
> [    0.006255] ACPI: FPDT 0x0000000089CAD000 000044 (v01 ACRSYS ACRPRDCT =
00000002 1025 00040000)
> [    0.006257] ACPI: BGRT 0x0000000089CAC000 000038 (v01 ACRSYS ACRPRDCT =
00000001 1025 00040000)
> [    0.006259] ACPI: Reserving FACP table memory at [mem 0x89cf0000-0x89c=
f010b]
> [    0.006259] ACPI: Reserving DSDT table memory at [mem 0x89cb3000-0x89c=
ea3ca]
> [    0.006260] ACPI: Reserving FACS table memory at [mem 0x89c0d000-0x89c=
0d03f]
> [    0.006261] ACPI: Reserving UEFI table memory at [mem 0x89d0c000-0x89d=
0c235]
> [    0.006261] ACPI: Reserving SSDT table memory at [mem 0x89d0a000-0x89d=
0b7d4]
> [    0.006262] ACPI: Reserving SSDT table memory at [mem 0x89d06000-0x89d=
091c6]
> [    0.006262] ACPI: Reserving SSDT table memory at [mem 0x89d04000-0x89d=
05dc7]
> [    0.006263] ACPI: Reserving UEFI table memory at [mem 0x89d03000-0x89d=
03041]
> [    0.006263] ACPI: Reserving SSDT table memory at [mem 0x89d02000-0x89d=
02459]
> [    0.006264] ACPI: Reserving SSDT table memory at [mem 0x89d01000-0x89d=
01045]
> [    0.006264] ACPI: Reserving TPM2 table memory at [mem 0x89d00000-0x89d=
00033]
> [    0.006265] ACPI: Reserving LPIT table memory at [mem 0x89cff000-0x89c=
ff05b]
> [    0.006265] ACPI: Reserving WSMT table memory at [mem 0x89cfe000-0x89c=
fe027]
> [    0.006266] ACPI: Reserving SSDT table memory at [mem 0x89cfd000-0x89c=
fdc2e]
> [    0.006266] ACPI: Reserving SSDT table memory at [mem 0x89cfc000-0x89c=
fcfba]
> [    0.006267] ACPI: Reserving DBGP table memory at [mem 0x89cfb000-0x89c=
fb033]
> [    0.006267] ACPI: Reserving DBG2 table memory at [mem 0x89cfa000-0x89c=
fa053]
> [    0.006268] ACPI: Reserving SSDT table memory at [mem 0x89cf9000-0x89c=
f9b73]
> [    0.006268] ACPI: Reserving SSDT table memory at [mem 0x89cf3000-0x89c=
f88c0]
> [    0.006269] ACPI: Reserving ASF! table memory at [mem 0x89cf1000-0x89c=
f10a4]
> [    0.006269] ACPI: Reserving HPET table memory at [mem 0x89cef000-0x89c=
ef037]
> [    0.006270] ACPI: Reserving APIC table memory at [mem 0x89cee000-0x89c=
ee12b]
> [    0.006270] ACPI: Reserving MCFG table memory at [mem 0x89cec000-0x89c=
ec03b]
> [    0.006271] ACPI: Reserving SSDT table memory at [mem 0x89cae000-0x89c=
b24db]
> [    0.006272] ACPI: Reserving DMAR table memory at [mem 0x89ceb000-0x89c=
eb0a7]
> [    0.006272] ACPI: Reserving FPDT table memory at [mem 0x89cad000-0x89c=
ad043]
> [    0.006273] ACPI: Reserving BGRT table memory at [mem 0x89cac000-0x89c=
ac037]
> [    0.006281] ACPI: Local APIC address 0xfee00000
> [    0.006579] No NUMA configuration found
> [    0.006580] Faking a node at [mem 0x0000000000000000-0x000000046e7ffff=
f]
> [    0.006586] NODE_DATA(0) allocated [mem 0x46e7d6000-0x46e7fffff]
> [    0.006805] Zone ranges:
> [    0.006806]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.006807]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.006808]   Normal   [mem 0x0000000100000000-0x000000046e7fffff]
> [    0.006808]   Device   empty
> [    0.006809] Movable zone start for each node
> [    0.006811] Early memory node ranges
> [    0.006812]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.006812]   node   0: [mem 0x0000000000100000-0x0000000071896fff]
> [    0.006813]   node   0: [mem 0x0000000072997000-0x0000000088badfff]
> [    0.006814]   node   0: [mem 0x0000000089d0e000-0x0000000089d0efff]
> [    0.006814]   node   0: [mem 0x0000000100000000-0x000000046e7fffff]
> [    0.006816] Initmem setup node 0 [mem 0x0000000000001000-0x000000046e7=
fffff]
> [    0.006817] On node 0 totalpages: 4153933
> [    0.006817]   DMA zone: 64 pages used for memmap
> [    0.006818]   DMA zone: 22 pages reserved
> [    0.006818]   DMA zone: 3998 pages, LIFO batch:0
> [    0.007006]   DMA zone: 28770 pages in unavailable ranges
> [    0.007007]   DMA32 zone: 8619 pages used for memmap
> [    0.007007]   DMA32 zone: 551599 pages, LIFO batch:63
> [    0.009989]   DMA32 zone: 34129 pages in unavailable ranges
> [    0.009990]   Normal zone: 56224 pages used for memmap
> [    0.009990]   Normal zone: 3598336 pages, LIFO batch:63
> [    0.010208]   Normal zone: 6144 pages in unavailable ranges
> [    0.010210] x86/hpet: Will disable the HPET for this platform because =
it's not reliable
> [    0.010233] Reserving Intel graphics memory at [mem 0x8b800000-0x8f7ff=
fff]
> [    0.011187] ACPI: PM-Timer IO Port: 0x1808
> [    0.011188] ACPI: Local APIC address 0xfee00000
> [    0.011193] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
> [    0.011193] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
> [    0.011194] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
> [    0.011194] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
> [    0.011194] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
> [    0.011195] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
> [    0.011195] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
> [    0.011196] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
> [    0.011196] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
> [    0.011196] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
> [    0.011197] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
> [    0.011197] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
> [    0.011198] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
> [    0.011198] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
> [    0.011199] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
> [    0.011199] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
> [    0.011259] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI =
0-119
> [    0.011260] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.011261] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level=
)
> [    0.011262] ACPI: IRQ0 used by override.
> [    0.011262] ACPI: IRQ9 used by override.
> [    0.011263] Using ACPI (MADT) for SMP configuration information
> [    0.011264] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.011268] e820: update [mem 0x78fe9000-0x790dcfff] usable =3D=3D> re=
served
> [    0.011273] TSC deadline timer available
> [    0.011274] smpboot: Allowing 12 CPUs, 0 hotplug CPUs
> [    0.011285] PM: hibernation: Registered nosave memory: [mem 0x00000000=
-0x00000fff]
> [    0.011286] PM: hibernation: Registered nosave memory: [mem 0x0009f000=
-0x000fffff]
> [    0.011287] PM: hibernation: Registered nosave memory: [mem 0x71897000=
-0x72996fff]
> [    0.011288] PM: hibernation: Registered nosave memory: [mem 0x78fe9000=
-0x790dcfff]
> [    0.011289] PM: hibernation: Registered nosave memory: [mem 0x88bae000=
-0x88dadfff]
> [    0.011290] PM: hibernation: Registered nosave memory: [mem 0x88dae000=
-0x8959dfff]
> [    0.011290] PM: hibernation: Registered nosave memory: [mem 0x8959e000=
-0x89c8dfff]
> [    0.011291] PM: hibernation: Registered nosave memory: [mem 0x89c8e000=
-0x89d0dfff]
> [    0.011292] PM: hibernation: Registered nosave memory: [mem 0x89d0f000=
-0x8f7fffff]
> [    0.011292] PM: hibernation: Registered nosave memory: [mem 0x8f800000=
-0xdfffffff]
> [    0.011292] PM: hibernation: Registered nosave memory: [mem 0xe0000000=
-0xefffffff]
> [    0.011293] PM: hibernation: Registered nosave memory: [mem 0xf0000000=
-0xfdffffff]
> [    0.011293] PM: hibernation: Registered nosave memory: [mem 0xfe000000=
-0xfe010fff]
> [    0.011294] PM: hibernation: Registered nosave memory: [mem 0xfe011000=
-0xfed0ffff]
> [    0.011294] PM: hibernation: Registered nosave memory: [mem 0xfed10000=
-0xfed19fff]
> [    0.011294] PM: hibernation: Registered nosave memory: [mem 0xfed1a000=
-0xfed83fff]
> [    0.011295] PM: hibernation: Registered nosave memory: [mem 0xfed84000=
-0xfed84fff]
> [    0.011295] PM: hibernation: Registered nosave memory: [mem 0xfed85000=
-0xfedfffff]
> [    0.011296] PM: hibernation: Registered nosave memory: [mem 0xfee00000=
-0xfee00fff]
> [    0.011296] PM: hibernation: Registered nosave memory: [mem 0xfee01000=
-0xff5fffff]
> [    0.011296] PM: hibernation: Registered nosave memory: [mem 0xff600000=
-0xffffffff]
> [    0.011297] [mem 0x8f800000-0xdfffffff] available for PCI devices
> [    0.011298] Booting paravirtualized kernel on bare hardware
> [    0.011300] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 7645519600211568 ns
> [    0.014192] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:12 nr_cpu_ids:1=
2 nr_node_ids:1
> [    0.014394] percpu: Embedded 54 pages/cpu s183960 r8192 d29032 u262144
> [    0.014399] pcpu-alloc: s183960 r8192 d29032 u262144 alloc=3D1*2097152
> [    0.014400] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 --=
 -- -- --
> [    0.014423] Built 1 zonelists, mobility grouping on.  Total pages: 408=
9004
> [    0.014423] Policy zone: Normal
> [    0.014424] Kernel command line: BOOT_IMAGE=3D/@/boot/vmlinuz-5.10.0-8=
parrot1-amd64 root=3DUUID=3Defd4b6b0-1a18-466d-b365-d62deb587b54 ro rootfla=
gs=3Dsubvol=3D@ quiet splash noautomount quiet splash
> [    0.015009] Dentry cache hash table entries: 2097152 (order: 12, 16777=
216 bytes, linear)
> [    0.015272] Inode-cache hash table entries: 1048576 (order: 11, 838860=
8 bytes, linear)
> [    0.015338] mem auto-init: stack:off, heap alloc:on, heap free:off
> [    0.024512] Memory: 2170976K/16615732K available (12295K kernel code, =
2544K rwdata, 7552K rodata, 2396K init, 3700K bss, 507044K reserved, 0K cma=
-reserved)
> [    0.024517] random: get_random_u64 called from __kmem_cache_create+0x2=
a/0x540 with crng_init=3D0
> [    0.024602] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D12=
, Nodes=3D1
> [    0.024612] Kernel/User page tables isolation: enabled
> [    0.024624] ftrace: allocating 36395 entries in 143 pages
> [    0.032797] ftrace: allocated 143 pages with 5 groups
> [    0.032878] rcu: Hierarchical RCU implementation.
> [    0.032879] rcu:     RCU restricting CPUs from NR_CPUS=3D8192 to nr_cp=
u_ids=3D12.
> [    0.032879]     Rude variant of Tasks RCU enabled.
> [    0.032880]     Tracing variant of Tasks RCU enabled.
> [    0.032880] rcu: RCU calculated value of scheduler-enlistment delay is=
 25 jiffies.
> [    0.032881] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D12
> [    0.035260] NR_IRQS: 524544, nr_irqs: 2152, preallocated irqs: 16
> [    0.035868] random: crng done (trusting CPU's manufacturer)
> [    0.035885] Console: colour dummy device 80x25
> [    0.035894] printk: console [tty0] enabled
> [    0.035906] ACPI: Core revision 20200925
> [    0.036085] APIC: Switch to symmetric I/O mode setup
> [    0.036086] DMAR: Host address width 39
> [    0.036087] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
> [    0.036090] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c406=
60462 ecap 19e2ff0505e
> [    0.036091] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
> [    0.036093] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c4066=
0462 ecap f050da
> [    0.036094] DMAR: RMRR base: 0x00000089575000 end: 0x00000089594fff
> [    0.036095] DMAR: RMRR base: 0x0000008b000000 end: 0x0000008f7fffff
> [    0.036096] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
> [    0.036097] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
> [    0.036097] DMAR-IR: Queued invalidation will be enabled to support x2=
apic and Intr-remapping.
> [    0.039172] DMAR-IR: Enabled IRQ remapping in x2apic mode
> [    0.039173] x2apic enabled
> [    0.039204] Switched APIC routing to cluster x2apic.
> [    0.048332] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycle=
s: 0x1fb62f12e8c, max_idle_ns: 440795238402 ns
> [    0.048336] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 4399.99 BogoMIPS (lpj=3D8799984)
> [    0.048337] pid_max: default: 32768 minimum: 301
> [    0.050278] LSM: Security Framework initializing
> [    0.050287] Yama: disabled by default; enable with sysctl kernel.yama.=
*
> [    0.050304] AppArmor: AppArmor initialized
> [    0.050305] TOMOYO Linux initialized
> [    0.050329] Mount-cache hash table entries: 32768 (order: 6, 262144 by=
tes, linear)
> [    0.050352] Mountpoint-cache hash table entries: 32768 (order: 6, 2621=
44 bytes, linear)
> [    0.050535] mce: CPU0: Thermal monitoring enabled (TM1)
> [    0.050552] process: using mwait in idle threads
> [    0.050554] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
> [    0.050554] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
> [    0.050557] Spectre V1 : Mitigation: usercopy/swapgs barriers and __us=
er pointer sanitization
> [    0.050558] Spectre V2 : Mitigation: Full generic retpoline
> [    0.050558] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling R=
SB on context switch
> [    0.050559] Spectre V2 : Enabling Restricted Speculation for firmware =
calls
> [    0.050560] Spectre V2 : mitigation: Enabling conditional Indirect Bra=
nch Prediction Barrier
> [    0.050560] Spectre V2 : User space: Mitigation: STIBP via seccomp and=
 prctl
> [    0.050561] Speculative Store Bypass: Mitigation: Speculative Store By=
pass disabled via prctl and seccomp
> [    0.050564] SRBDS: Mitigation: Microcode
> [    0.050564] MDS: Mitigation: Clear CPU buffers
> [    0.050667] Freeing SMP alternatives memory: 32K
> [    0.052334] smpboot: CPU0: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz (f=
amily: 0x6, model: 0x9e, stepping: 0xa)
> [    0.052334] Performance Events: PEBS fmt3+, Skylake events, 32-deep LB=
R, full-width counters, Intel PMU driver.
> [    0.052334] ... version:                4
> [    0.052334] ... bit width:              48
> [    0.052334] ... generic registers:      4
> [    0.052334] ... value mask:             0000ffffffffffff
> [    0.052334] ... max period:             00007fffffffffff
> [    0.052334] ... fixed-purpose events:   3
> [    0.052334] ... event mask:             000000070000000f
> [    0.052334] rcu: Hierarchical SRCU implementation.
> [    0.052334] NMI watchdog: Enabled. Permanently consumes one hw-PMU cou=
nter.
> [    0.052334] smp: Bringing up secondary CPUs ...
> [    0.052334] x86: Booting SMP configuration:
> [    0.052334] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6
> [    0.057424] MDS CPU bug present and SMT on, data leak possible. See ht=
tps://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more =
details.
> [    0.057424]   #7  #8  #9 #10 #11
> [    0.057424] smp: Brought up 1 node, 12 CPUs
> [    0.057424] smpboot: Max logical packages: 1
> [    0.057424] smpboot: Total of 12 processors activated (52799.90 BogoMI=
PS)
> [    0.079456] node 0 deferred pages initialised in 16ms
> [    0.079457] devtmpfs: initialized
> [    0.079457] x86/mm: Memory block size: 128MB
> [    0.080489] PM: Registering ACPI NVS region [mem 0x8959e000-0x89c8dfff=
] (7274496 bytes)
> [    0.080489] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 7645041785100000 ns
> [    0.080489] futex hash table entries: 4096 (order: 6, 262144 bytes, li=
near)
> [    0.080500] pinctrl core: initialized pinctrl subsystem
> [    0.080629] NET: Registered protocol family 16
> [    0.080694] audit: initializing netlink subsys (disabled)
> [    0.080697] audit: type=3D2000 audit(1631182762.032:1): state=3Dinitia=
lized audit_enabled=3D0 res=3D1
> [    0.080697] thermal_sys: Registered thermal governor 'fair_share'
> [    0.080697] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.080697] thermal_sys: Registered thermal governor 'step_wise'
> [    0.080697] thermal_sys: Registered thermal governor 'user_space'
> [    0.080697] thermal_sys: Registered thermal governor 'power_allocator'
> [    0.080697] cpuidle: using governor ladder
> [    0.080697] cpuidle: using governor menu
> [    0.080697] ACPI FADT declares the system doesn't support PCIe ASPM, s=
o disable it
> [    0.080697] ACPI: bus type PCI registered
> [    0.080697] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.080697] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe00000=
00-0xefffffff] (base 0xe0000000)
> [    0.080697] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E=
820
> [    0.080697] PCI: Using configuration type 1 for base access
> [    0.080715] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
> [    0.080770] Kprobes globally optimized
> [    0.080772] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pag=
es
> [    0.080772] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pag=
es
> [    0.168672] ACPI: Added _OSI(Module Device)
> [    0.168672] ACPI: Added _OSI(Processor Device)
> [    0.168672] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.168672] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.168672] ACPI: Added _OSI(Linux-Dell-Video)
> [    0.168672] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    0.168672] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    0.198575] ACPI: 11 ACPI AML tables successfully acquired and loaded
> [    0.203308] ACPI: Dynamic OEM Table Load:
> [    0.203316] ACPI: SSDT 0xFFFF8F0300C8C800 0005BE (v02 PmRef  Cpu0Ist  =
00003000 INTL 20160422)
> [    0.204177] ACPI: \_SB_.PR00: _OSC native thermal LVT Acked
> [    0.205416] ACPI: Dynamic OEM Table Load:
> [    0.205421] ACPI: SSDT 0xFFFF8F045FDF3800 000400 (v02 PmRef  Cpu0Cst  =
00003001 INTL 20160422)
> [    0.206252] ACPI: Dynamic OEM Table Load:
> [    0.206256] ACPI: SSDT 0xFFFF8F045FDBCA00 00010A (v02 PmRef  Cpu0Hwp  =
00003000 INTL 20160422)
> [    0.207047] ACPI: Dynamic OEM Table Load:
> [    0.207051] ACPI: SSDT 0xFFFF8F0300C89800 000724 (v02 PmRef  HwpLvt   =
00003000 INTL 20160422)
> [    0.208055] ACPI: Dynamic OEM Table Load:
> [    0.208060] ACPI: SSDT 0xFFFF8F0300CA5000 000EF1 (v02 PmRef  ApIst    =
00003000 INTL 20160422)
> [    0.209309] ACPI: Dynamic OEM Table Load:
> [    0.209313] ACPI: SSDT 0xFFFF8F045FDF7000 000317 (v02 PmRef  ApHwp    =
00003000 INTL 20160422)
> [    0.210165] ACPI: Dynamic OEM Table Load:
> [    0.210169] ACPI: SSDT 0xFFFF8F045FDF0000 00030A (v02 PmRef  ApCst    =
00003000 INTL 20160422)
> [    0.213990] ACPI: EC: EC started
> [    0.213990] ACPI: EC: interrupt blocked
> [    0.214217] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
> [    0.214218] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle tr=
ansactions
> [    0.214218] ACPI: Interpreter enabled
> [    0.214250] ACPI: (supports S0 S3 S4 S5)
> [    0.214251] ACPI: Using IOAPIC for interrupt routing
> [    0.214274] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.215301] ACPI: Enabled 6 GPEs in block 00 to 7F
> [    0.215808] ACPI: Power Resource [PG00] (on)
> [    0.216189] ACPI: Power Resource [PG01] (on)
> [    0.220412] ACPI: Power Resource [PG02] (on)
> [    0.223688] ACPI: Power Resource [USBC] (on)
> [    0.229763] ACPI: Power Resource [V0PR] (on)
> [    0.229872] ACPI: Power Resource [V1PR] (on)
> [    0.229977] ACPI: Power Resource [V2PR] (on)
> [    0.233672] ACPI: Power Resource [WRST] (on)
> [    0.233823] acpi ABCD0000:00: ACPI dock station (docks/bays count: 1)
> [    0.237276] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
> [    0.237280] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cl=
ockPM Segments MSI HPX-Type3]
> [    0.237408] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotp=
lug SHPCHotplug PME]
> [    0.237525] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability=
 LTR]
> [    0.237526] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using=
 BIOS configuration
> [    0.239498] PCI host bridge to bus 0000:00
> [    0.239500] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    0.239501] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
> [    0.239501] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
> [    0.239502] pci_bus 0000:00: root bus resource [mem 0x8f800000-0xdffff=
fff window]
> [    0.239503] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe7ff=
fff window]
> [    0.239503] pci_bus 0000:00: root bus resource [bus 00-fe]
> [    0.239521] pci 0000:00:00.0: [8086:3ec4] type 00 class 0x060000
> [    0.240344] pci 0000:00:01.0: [8086:1901] type 01 class 0x060400
> [    0.240376] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
> [    0.241112] pci 0000:00:02.0: [8086:3e9b] type 00 class 0x030000
> [    0.241117] pci 0000:00:02.0: reg 0x10: [mem 0xa2000000-0xa2ffffff 64b=
it]
> [    0.241121] pci 0000:00:02.0: reg 0x18: [mem 0xb0000000-0xbfffffff 64b=
it pref]
> [    0.241123] pci 0000:00:02.0: reg 0x20: [io  0x5000-0x503f]
> [    0.241135] pci 0000:00:02.0: BAR 2: assigned to efifb
> [    0.241861] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
> [    0.241868] pci 0000:00:08.0: reg 0x10: [mem 0xa441c000-0xa441cfff 64b=
it]
> [    0.242650] pci 0000:00:12.0: [8086:a379] type 00 class 0x118000
> [    0.242676] pci 0000:00:12.0: reg 0x10: [mem 0xa441d000-0xa441dfff 64b=
it]
> [    0.243518] pci 0000:00:14.0: [8086:a36d] type 00 class 0x0c0330
> [    0.243542] pci 0000:00:14.0: reg 0x10: [mem 0xa4400000-0xa440ffff 64b=
it]
> [    0.243645] pci 0000:00:14.0: PME# supported from D3hot D3cold
> [    0.244370] pci 0000:00:14.2: [8086:a36f] type 00 class 0x050000
> [    0.244394] pci 0000:00:14.2: reg 0x10: [mem 0xa4418000-0xa4419fff 64b=
it]
> [    0.244411] pci 0000:00:14.2: reg 0x18: [mem 0xa441e000-0xa441efff 64b=
it]
> [    0.245260] pci 0000:00:14.3: [8086:a370] type 00 class 0x028000
> [    0.245391] pci 0000:00:14.3: reg 0x10: [mem 0xa4410000-0xa4413fff 64b=
it]
> [    0.246095] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
> [    0.247442] pci 0000:00:15.0: [8086:a368] type 00 class 0x0c8000
> [    0.247944] pci 0000:00:15.0: reg 0x10: [mem 0x00000000-0x00000fff 64b=
it]
> [    0.251342] pci 0000:00:15.1: [8086:a369] type 00 class 0x0c8000
> [    0.251920] pci 0000:00:15.1: reg 0x10: [mem 0x00000000-0x00000fff 64b=
it]
> [    0.254757] pci 0000:00:16.0: [8086:a360] type 00 class 0x078000
> [    0.254780] pci 0000:00:16.0: reg 0x10: [mem 0xa4421000-0xa4421fff 64b=
it]
> [    0.254868] pci 0000:00:16.0: PME# supported from D3hot
> [    0.255671] pci 0000:00:17.0: [8086:a353] type 00 class 0x010601
> [    0.255691] pci 0000:00:17.0: reg 0x10: [mem 0xa441a000-0xa441bfff]
> [    0.255702] pci 0000:00:17.0: reg 0x14: [mem 0xa4426000-0xa44260ff]
> [    0.255713] pci 0000:00:17.0: reg 0x18: [io  0x5080-0x5087]
> [    0.255723] pci 0000:00:17.0: reg 0x1c: [io  0x5088-0x508b]
> [    0.255734] pci 0000:00:17.0: reg 0x20: [io  0x5060-0x507f]
> [    0.255745] pci 0000:00:17.0: reg 0x24: [mem 0xa4425000-0xa44257ff]
> [    0.255806] pci 0000:00:17.0: PME# supported from D3hot
> [    0.256580] pci 0000:00:1d.0: [8086:a330] type 01 class 0x060400
> [    0.256722] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
> [    0.256757] pci 0000:00:1d.0: PTM enabled (root), 4ns granularity
> [    0.257536] pci 0000:00:1d.5: [8086:a335] type 01 class 0x060400
> [    0.257676] pci 0000:00:1d.5: PME# supported from D0 D3hot D3cold
> [    0.257707] pci 0000:00:1d.5: PTM enabled (root), 4ns granularity
> [    0.258711] pci 0000:00:1e.0: [8086:a328] type 00 class 0x078000
> [    0.259215] pci 0000:00:1e.0: reg 0x10: [mem 0x00000000-0x00000fff 64b=
it]
> [    0.262129] pci 0000:00:1f.0: [8086:a30d] type 00 class 0x060100
> [    0.263096] pci 0000:00:1f.3: [8086:a348] type 00 class 0x040300
> [    0.263153] pci 0000:00:1f.3: reg 0x10: [mem 0xa4414000-0xa4417fff 64b=
it]
> [    0.263246] pci 0000:00:1f.3: reg 0x20: [mem 0xa4100000-0xa41fffff 64b=
it]
> [    0.263386] pci 0000:00:1f.3: PME# supported from D3hot D3cold
> [    0.264181] pci 0000:00:1f.4: [8086:a323] type 00 class 0x0c0500
> [    0.264235] pci 0000:00:1f.4: reg 0x10: [mem 0xa4423000-0xa44230ff 64b=
it]
> [    0.264300] pci 0000:00:1f.4: reg 0x20: [io  0x5040-0x505f]
> [    0.265055] pci 0000:00:1f.5: [8086:a324] type 00 class 0x0c8000
> [    0.265074] pci 0000:00:1f.5: reg 0x10: [mem 0xfe010000-0xfe010fff]
> [    0.265830] pci 0000:01:00.0: [10de:1c8d] type 00 class 0x030000
> [    0.265837] pci 0000:01:00.0: reg 0x10: [mem 0xa3000000-0xa3ffffff]
> [    0.265843] pci 0000:01:00.0: reg 0x14: [mem 0x90000000-0x9fffffff 64b=
it pref]
> [    0.265849] pci 0000:01:00.0: reg 0x1c: [mem 0xa0000000-0xa1ffffff 64b=
it pref]
> [    0.265853] pci 0000:01:00.0: reg 0x24: [io  0x4000-0x407f]
> [    0.265857] pci 0000:01:00.0: reg 0x30: [mem 0xfff80000-0xffffffff pre=
f]
> [    0.265962] pci 0000:01:00.1: [10de:0fb9] type 00 class 0x040300
> [    0.265969] pci 0000:01:00.1: reg 0x10: [mem 0xa4000000-0xa4003fff]
> [    0.266054] pci 0000:00:01.0: PCI bridge to [bus 01-05]
> [    0.266056] pci 0000:00:01.0:   bridge window [io  0x4000-0x4fff]
> [    0.266057] pci 0000:00:01.0:   bridge window [mem 0xa3000000-0xa40fff=
ff]
> [    0.266059] pci 0000:00:01.0:   bridge window [mem 0x90000000-0xa1ffff=
ff 64bit pref]
> [    0.266296] pci 0000:06:00.0: [144d:a808] type 00 class 0x010802
> [    0.266322] pci 0000:06:00.0: reg 0x10: [mem 0xa4300000-0xa4303fff 64b=
it]
> [    0.266673] pci 0000:00:1d.0: PCI bridge to [bus 06]
> [    0.266679] pci 0000:00:1d.0:   bridge window [mem 0xa4300000-0xa43fff=
ff]
> [    0.266769] pci 0000:07:00.0: [10ec:5287] type 00 class 0xff0000
> [    0.266789] pci 0000:07:00.0: reg 0x10: [mem 0xa4205000-0xa4205fff]
> [    0.266851] pci 0000:07:00.0: reg 0x30: [mem 0xffff0000-0xffffffff pre=
f]
> [    0.266971] pci 0000:07:00.0: supports D1 D2
> [    0.266972] pci 0000:07:00.0: PME# supported from D1 D2 D3hot D3cold
> [    0.267144] pci 0000:07:00.1: [10ec:8168] type 00 class 0x020000
> [    0.267164] pci 0000:07:00.1: reg 0x10: [io  0x3000-0x30ff]
> [    0.267191] pci 0000:07:00.1: reg 0x18: [mem 0xa4204000-0xa4204fff 64b=
it]
> [    0.267208] pci 0000:07:00.1: reg 0x20: [mem 0xa4200000-0xa4203fff 64b=
it]
> [    0.267329] pci 0000:07:00.1: supports D1 D2
> [    0.267329] pci 0000:07:00.1: PME# supported from D0 D1 D2 D3hot D3col=
d
> [    0.267473] pci 0000:00:1d.5: PCI bridge to [bus 07]
> [    0.267477] pci 0000:00:1d.5:   bridge window [io  0x3000-0x3fff]
> [    0.267480] pci 0000:00:1d.5:   bridge window [mem 0xa4200000-0xa42fff=
ff]
> [    0.269104] ACPI: EC: interrupt unblocked
> [    0.269105] ACPI: EC: event unblocked
> [    0.269122] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
> [    0.269123] ACPI: EC: GPE=3D0x14
> [    0.269124] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization co=
mplete
> [    0.269125] ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transaction=
s and events
> [    0.269166] iommu: Default domain type: Translated
> [    0.269175] pci 0000:00:02.0: vgaarb: setting as boot VGA device
> [    0.269175] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+m=
em,owns=3Dio+mem,locks=3Dnone
> [    0.269175] pci 0000:01:00.0: vgaarb: VGA device added: decodes=3Dio+m=
em,owns=3Dnone,locks=3Dnone
> [    0.269175] pci 0000:00:02.0: vgaarb: no bridge control possible
> [    0.269175] pci 0000:01:00.0: vgaarb: bridge control possible
> [    0.269175] vgaarb: loaded
> [    0.269175] EDAC MC: Ver: 3.0.0
> [    0.269175] Registered efivars operations
> [    0.269175] NetLabel: Initializing
> [    0.269175] NetLabel:  domain hash size =3D 128
> [    0.269175] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
> [    0.269175] NetLabel:  unlabeled traffic allowed by default
> [    0.269175] PCI: Using ACPI for IRQ routing
> [    0.352494] PCI: pci_cache_line_size set to 64 bytes
> [    0.353149] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
> [    0.353150] e820: reserve RAM buffer [mem 0x71897000-0x73ffffff]
> [    0.353150] e820: reserve RAM buffer [mem 0x78fe9000-0x7bffffff]
> [    0.353151] e820: reserve RAM buffer [mem 0x88bae000-0x8bffffff]
> [    0.353152] e820: reserve RAM buffer [mem 0x89d0f000-0x8bffffff]
> [    0.353152] e820: reserve RAM buffer [mem 0x46e800000-0x46fffffff]
> [    0.353810] clocksource: Switched to clocksource tsc-early
> [    0.358528] VFS: Disk quotas dquot_6.6.0
> [    0.358540] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)
> [    0.358608] AppArmor: AppArmor Filesystem Enabled
> [    0.358618] pnp: PnP ACPI init
> [    0.358863] system 00:00: [io  0x1800-0x18fe] has been reserved
> [    0.358863] system 00:00: [mem 0xfd000000-0xfd69ffff] has been reserve=
d
> [    0.358863] system 00:00: [mem 0xfd6c0000-0xfd6cffff] has been reserve=
d
> [    0.358863] system 00:00: [mem 0xfd6f0000-0xfdffffff] has been reserve=
d
> [    0.358863] system 00:00: [mem 0xfe000000-0xfe01ffff] could not be res=
erved
> [    0.358863] system 00:00: [mem 0xfe200000-0xfe7fffff] has been reserve=
d
> [    0.358863] system 00:00: [mem 0xfc7e0000-0xfc7e0fff] has been reserve=
d
> [    0.358863] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (acti=
ve)
> [    0.358863] system 00:01: [io  0x2000-0x20fe] has been reserved
> [    0.358863] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (acti=
ve)
> [    0.358863] system 00:02: [io  0x0680-0x069f] has been reserved
> [    0.358863] system 00:02: [io  0x164e-0x164f] has been reserved
> [    0.358863] system 00:02: [io  0xfd60-0xfd63] has been reserved
> [    0.358863] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (acti=
ve)
> [    0.358863] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.358863] system 00:04: [io  0x1854-0x1857] has been reserved
> [    0.358863] system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c=
02 (active)
> [    0.358863] pnp 00:05: Plug and Play ACPI device, IDs PNP0303 (active)
> [    0.358863] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (acti=
ve)
> [    0.360647] system 00:07: [mem 0xfed10000-0xfed17fff] has been reserve=
d
> [    0.360648] system 00:07: [mem 0xfed18000-0xfed18fff] has been reserve=
d
> [    0.360649] system 00:07: [mem 0xfed19000-0xfed19fff] has been reserve=
d
> [    0.360650] system 00:07: [mem 0xe0000000-0xefffffff] has been reserve=
d
> [    0.360651] system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserve=
d
> [    0.360652] system 00:07: [mem 0xfed90000-0xfed93fff] could not be res=
erved
> [    0.360652] system 00:07: [mem 0xfed45000-0xfed8ffff] could not be res=
erved
> [    0.360653] system 00:07: [mem 0xfee00000-0xfeefffff] could not be res=
erved
> [    0.360659] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (acti=
ve)
> [    0.360925] pnp: PnP ACPI: found 8 devices
> [    0.366132] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> [    0.366170] NET: Registered protocol family 2
> [    0.366277] IP idents hash table entries: 262144 (order: 9, 2097152 by=
tes, linear)
> [    0.367476] tcp_listen_portaddr_hash hash table entries: 8192 (order: =
5, 131072 bytes, linear)
> [    0.367529] TCP established hash table entries: 131072 (order: 8, 1048=
576 bytes, linear)
> [    0.367642] TCP bind hash table entries: 65536 (order: 8, 1048576 byte=
s, linear)
> [    0.367687] TCP: Hash tables configured (established 131072 bind 65536=
)
> [    0.367719] UDP hash table entries: 8192 (order: 6, 262144 bytes, line=
ar)
> [    0.367748] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes,=
 linear)
> [    0.367859] NET: Registered protocol family 1
> [    0.367862] NET: Registered protocol family 44
> [    0.367865] pci 0000:01:00.0: can't claim BAR 6 [mem 0xfff80000-0xffff=
ffff pref]: no compatible bridge window
> [    0.367866] pci 0000:07:00.0: can't claim BAR 6 [mem 0xffff0000-0xffff=
ffff pref]: no compatible bridge window
> [    0.367875] pci 0000:00:15.0: BAR 0: assigned [mem 0x8f800000-0x8f800f=
ff 64bit]
> [    0.368146] pci 0000:00:15.1: BAR 0: assigned [mem 0x8f801000-0x8f801f=
ff 64bit]
> [    0.368417] pci 0000:00:1e.0: BAR 0: assigned [mem 0x8f802000-0x8f802f=
ff 64bit]
> [    0.368689] pci 0000:01:00.0: BAR 6: assigned [mem 0xa4080000-0xa40fff=
ff pref]
> [    0.368690] pci 0000:00:01.0: PCI bridge to [bus 01-05]
> [    0.368691] pci 0000:00:01.0:   bridge window [io  0x4000-0x4fff]
> [    0.368693] pci 0000:00:01.0:   bridge window [mem 0xa3000000-0xa40fff=
ff]
> [    0.368694] pci 0000:00:01.0:   bridge window [mem 0x90000000-0xa1ffff=
ff 64bit pref]
> [    0.368697] pci 0000:00:1d.0: PCI bridge to [bus 06]
> [    0.368706] pci 0000:00:1d.0:   bridge window [mem 0xa4300000-0xa43fff=
ff]
> [    0.368722] pci 0000:07:00.0: BAR 6: assigned [mem 0xa4210000-0xa421ff=
ff pref]
> [    0.368723] pci 0000:00:1d.5: PCI bridge to [bus 07]
> [    0.368725] pci 0000:00:1d.5:   bridge window [io  0x3000-0x3fff]
> [    0.368730] pci 0000:00:1d.5:   bridge window [mem 0xa4200000-0xa42fff=
ff]
> [    0.368740] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [    0.368740] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> [    0.368741] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff win=
dow]
> [    0.368742] pci_bus 0000:00: resource 7 [mem 0x8f800000-0xdfffffff win=
dow]
> [    0.368742] pci_bus 0000:00: resource 8 [mem 0xfc800000-0xfe7fffff win=
dow]
> [    0.368743] pci_bus 0000:01: resource 0 [io  0x4000-0x4fff]
> [    0.368744] pci_bus 0000:01: resource 1 [mem 0xa3000000-0xa40fffff]
> [    0.368744] pci_bus 0000:01: resource 2 [mem 0x90000000-0xa1ffffff 64b=
it pref]
> [    0.368745] pci_bus 0000:06: resource 1 [mem 0xa4300000-0xa43fffff]
> [    0.368746] pci_bus 0000:07: resource 0 [io  0x3000-0x3fff]
> [    0.368747] pci_bus 0000:07: resource 1 [mem 0xa4200000-0xa42fffff]
> [    0.368852] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0=
x000c0000-0x000dffff]
> [    0.370438] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
> [    0.370601] PCI: CLS 64 bytes, default 64
> [    0.370645] Trying to unpack rootfs image as initramfs...
> [    1.115830] Freeing initrd memory: 79600K
> [    1.115866] DMAR: No ATSR found
> [    1.115907] DMAR: dmar0: Using Queued invalidation
> [    1.115909] DMAR: dmar1: Using Queued invalidation
> [    1.116072] pci 0000:00:00.0: Adding to iommu group 0
> [    1.116081] pci 0000:00:01.0: Adding to iommu group 1
> [    1.116087] pci 0000:00:02.0: Adding to iommu group 2
> [    1.116092] pci 0000:00:08.0: Adding to iommu group 3
> [    1.116103] pci 0000:00:12.0: Adding to iommu group 4
> [    1.116114] pci 0000:00:14.0: Adding to iommu group 5
> [    1.116119] pci 0000:00:14.2: Adding to iommu group 5
> [    1.116125] pci 0000:00:14.3: Adding to iommu group 6
> [    1.116135] pci 0000:00:15.0: Adding to iommu group 7
> [    1.116141] pci 0000:00:15.1: Adding to iommu group 7
> [    1.116149] pci 0000:00:16.0: Adding to iommu group 8
> [    1.116155] pci 0000:00:17.0: Adding to iommu group 9
> [    1.116168] pci 0000:00:1d.0: Adding to iommu group 10
> [    1.116176] pci 0000:00:1d.5: Adding to iommu group 11
> [    1.116184] pci 0000:00:1e.0: Adding to iommu group 12
> [    1.116198] pci 0000:00:1f.0: Adding to iommu group 13
> [    1.116205] pci 0000:00:1f.3: Adding to iommu group 13
> [    1.116211] pci 0000:00:1f.4: Adding to iommu group 13
> [    1.116217] pci 0000:00:1f.5: Adding to iommu group 13
> [    1.116220] pci 0000:01:00.0: Adding to iommu group 1
> [    1.116223] pci 0000:01:00.1: Adding to iommu group 1
> [    1.116234] pci 0000:06:00.0: Adding to iommu group 14
> [    1.116246] pci 0000:07:00.0: Adding to iommu group 15
> [    1.116260] pci 0000:07:00.1: Adding to iommu group 15
> [    1.118245] DMAR: Intel(R) Virtualization Technology for Directed I/O
> [    1.118246] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> [    1.118248] software IO TLB: mapped [mem 0x000000008455c000-0x00000000=
8855c000] (64MB)
> [    1.118690] Initialise system trusted keyrings
> [    1.118700] Key type blacklist registered
> [    1.118731] workingset: timestamp_bits=3D36 max_order=3D22 bucket_orde=
r=3D0
> [    1.119419] zbud: loaded
> [    1.119529] integrity: Platform Keyring initialized
> [    1.119530] Key type asymmetric registered
> [    1.119531] Asymmetric key parser 'x509' registered
> [    1.119535] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 251)
> [    1.119555] io scheduler mq-deadline registered
> [    1.123820] pcieport 0000:00:1d.0: AER: enabled with IRQ 123
> [    1.123850] pcieport 0000:00:1d.0: DPC: enabled with IRQ 123
> [    1.123852] pcieport 0000:00:1d.0: DPC: error containment capabilities=
: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
> [    1.124086] pcieport 0000:00:1d.5: AER: enabled with IRQ 124
> [    1.124118] pcieport 0000:00:1d.5: DPC: enabled with IRQ 124
> [    1.124119] pcieport 0000:00:1d.5: DPC: error containment capabilities=
: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
> [    1.124217] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
.4
> [    1.124226] efifb: probing for efifb
> [    1.124234] efifb: framebuffer at 0xb0000000, using 8128k, total 8128k
> [    1.124235] efifb: mode is 1920x1080x32, linelength=3D7680, pages=3D1
> [    1.124235] efifb: scrolling: redraw
> [    1.124236] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> [    1.124284] Console: switching to colour frame buffer device 240x67
> [    1.126547] fb0: EFI VGA frame buffer device
> [    1.126551] intel_idle: MWAIT substates: 0x11142120
> [    1.126552] intel_idle: v0.5.1 model 0x9E
> [    1.126986] intel_idle: Local APIC timer is reliable in all C-states
> [    1.128685] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    1.129251] hpet_acpi_add: no address or irqs in _CRS
> [    1.129270] Linux agpgart interface v0.103
> [    1.129290] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.d=
e>
> [    1.129291] AMD-Vi: AMD IOMMUv2 functionality not available on this sy=
stem
> [    1.130017] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 ir=
q 1
> [    1.130017] i8042: PNP: PS/2 appears to have AUX port disabled, if thi=
s is incorrect please boot with i8042.nopnp
> [    1.130709] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    1.130788] mousedev: PS/2 mouse device common for all mice
> [    1.130904] rtc_cmos 00:03: RTC can wake from S4
> [    1.131917] rtc_cmos 00:03: registered as rtc0
> [    1.132205] rtc_cmos 00:03: setting system clock to 2021-09-09T10:19:2=
3 UTC (1631182763)
> [    1.132213] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvr=
am
> [    1.132218] intel_pstate: Intel P-state driver initializing
> [    1.133544] intel_pstate: Disabling energy efficiency optimization
> [    1.133544] intel_pstate: HWP enabled
> [    1.133717] ledtrig-cpu: registered to indicate activity on CPUs
> [    1.133878] NET: Registered protocol family 10
> [    1.138690] Segment Routing with IPv6
> [    1.138718] mip6: Mobile IPv6
> [    1.138719] NET: Registered protocol family 17
> [    1.138822] mpls_gso: MPLS GSO support
> [    1.139554] microcode: sig=3D0x906ea, pf=3D0x20, revision=3D0xea
> [    1.139875] microcode: Microcode Update Driver: v2.2.
> [    1.139877] IPI shorthand broadcast: enabled
> [    1.139882] sched_clock: Marking stable (1126882419, 12588749)->(11522=
41844, -12770676)
> [    1.140147] registered taskstats version 1
> [    1.140148] Loading compiled-in X.509 certificates
> [    1.141972] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input0
> [    1.159779] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f=
6149f3dd27dfcc5cbb419ea1'
> [    1.159789] Loaded X.509 cert 'Debian Secure Boot Signer 2021 - linux:=
 4b6ef5abca669825178e052c84667ccbc0531f8c'
> [    1.159814] zswap: loaded using pool lzo/zbud
> [    1.160152] Key type ._fscrypt registered
> [    1.160153] Key type .fscrypt registered
> [    1.160153] Key type fscrypt-provisioning registered
> [    1.160188] AppArmor: AppArmor sha1 policy hashing enabled
> [    1.162873] integrity: Loading X.509 certificate: UEFI:db
> [    1.162900] integrity: Loaded X.509 cert 'Microsoft Windows Production=
 PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
> [    1.162900] integrity: Loading X.509 certificate: UEFI:db
> [    1.162917] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI C=
A 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
> [    1.162917] integrity: Loading X.509 certificate: UEFI:db
> [    1.162926] integrity: Loaded X.509 cert 'Acer Database: 84f00f5841571=
abd2cc11a8c26d5c9c8d2b6b0b5'
> [    1.162927] integrity: Loading X.509 certificate: UEFI:db
> [    1.162928] integrity: Problem loading X.509 certificate -65
> [    1.162943] integrity: Error adding keys to platform keyring UEFI:db
> [    1.162944] integrity: Loading X.509 certificate: UEFI:db
> [    1.162945] integrity: Problem loading X.509 certificate -65
> [    1.162956] integrity: Error adding keys to platform keyring UEFI:db
> [    1.162957] integrity: Loading X.509 certificate: UEFI:db
> [    1.163080] integrity: Loaded X.509 cert 'Linpus: linpus.com: 2e092cab=
5e97a89f94a6e272ec7267c267cf4483'
> [    1.166882] Freeing unused kernel image (initmem) memory: 2396K
> [    1.196495] Write protecting the kernel read-only data: 22528k
> [    1.197110] Freeing unused kernel image (text/rodata gap) memory: 2040=
K
> [    1.197354] Freeing unused kernel image (rodata/data gap) memory: 640K
> [    1.252341] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    1.252342] x86/mm: Checking user space page tables
> [    1.288692] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    1.288696] Run /init as init process
> [    1.288696]   with arguments:
> [    1.288697]     /init
> [    1.288697]     splash
> [    1.288698]     noautomount
> [    1.288698]     splash
> [    1.288698]   with environment:
> [    1.288699]     HOME=3D/
> [    1.288699]     TERM=3Dlinux
> [    1.288699]     BOOT_IMAGE=3D/@/boot/vmlinuz-5.10.0-8parrot1-amd64
> [    1.369843] button: module verification failed: signature and/or requi=
red key missing - tainting kernel
> [    1.370239] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
A08:00/device:18/PNP0C0D:00/input/input1
> [    1.370264] ACPI: Lid Switch [LID0]
> [    1.370316] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0E:00/input/input2
> [    1.370332] ACPI: Sleep Button [SLPB]
> [    1.370364] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0C:00/input/input3
> [    1.374702] wmi_bus wmi_bus-PNP0C14:01: WQ data block query control me=
thod not found
> [    1.374703] wmi_bus wmi_bus-PNP0C14:01: WQ data block query control me=
thod not found
> [    1.374704] wmi_bus wmi_bus-PNP0C14:01: WQ data block query control me=
thod not found
> [    1.374705] wmi_bus wmi_bus-PNP0C14:01: WQ data block query control me=
thod not found
> [    1.374802] acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F=
0-00A0C9062910 (first instance was on PNP0C14:00)
> [    1.374844] acpi PNP0C14:04: duplicate WMI GUID 05901221-D566-11D1-B2F=
0-00A0C9062910 (first instance was on PNP0C14:00)
> [    1.375895] battery: ACPI: Battery Slot [BAT1] (battery present)
> [    1.379702] hid: raw HID events driver (C) Jiri Kosina
> [    1.381994] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
> [    1.382300] idma64 idma64.0: Found Intel integrated DMA 64-bit
> [    1.384426] SCSI subsystem initialized
> [    1.384871] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> [    1.384920] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> [    1.388369] ACPI: Power Button [PWRB]
> [    1.388431] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input4
> [    1.388465] ACPI: Power Button [PWRF]
> [    1.391232] ACPI: bus type USB registered
> [    1.391250] i2c i2c-0: 2/2 memory slots populated (from DMI)
> [    1.391272] usbcore: registered new interface driver usbfs
> [    1.391290] usbcore: registered new interface driver hub
> [    1.391309] usbcore: registered new device driver usb
> [    1.391672] i2c i2c-0: Successfully instantiated SPD at 0x50
> [    1.392065] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
> [    1.392374] idma64 idma64.1: Found Intel integrated DMA 64-bit
> [    1.392730] cryptd: max_cpu_qlen set to 1000
> [    1.392758] libata version 3.00 loaded.
> [    1.395672] AVX2 version of gcm_enc/dec engaged.
> [    1.395673] AES CTR mode by8 optimization enabled
> [    1.396481] ahci 0000:00:17.0: version 3.0
> [    1.397141] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps =
0x10 impl SATA mode
> [    1.397144] ahci 0000:00:17.0: flags: 64bit ncq sntf pm clo only pio s=
lum part ems deso sadm sds apst
> [    1.399486] r8169 0000:07:00.1: can't disable ASPM; OS doesn't have AS=
PM control
> [    1.400031] xhci_hcd 0000:00:14.0: xHCI Host Controller
> [    1.400040] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 1
> [    1.401209] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0=
x110 quirks 0x0000000000009810
> [    1.401217] xhci_hcd 0000:00:14.0: cache line size of 64 is not suppor=
ted
> [    1.401625] i2c_hid i2c-ELAN0504:01: supply vdd not found, using dummy=
 regulator
> [    1.401650] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
> [    1.401655] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [    1.401656] i2c_hid i2c-ELAN0504:01: supply vddl not found, using dumm=
y regulator
> [    1.401658] usb usb1: Product: xHCI Host Controller
> [    1.401660] usb usb1: Manufacturer: Linux 5.10.0-8parrot1-amd64 xhci-h=
cd
> [    1.401661] usb usb1: SerialNumber: 0000:00:14.0
> [    1.401934] hub 1-0:1.0: USB hub found
> [    1.401966] hub 1-0:1.0: 16 ports detected
> [    1.402254] scsi host0: ahci
> [    1.402393] scsi host1: ahci
> [    1.402499] scsi host2: ahci
> [    1.402613] scsi host3: ahci
> [    1.403434] nvme nvme0: pci function 0000:06:00.0
> [    1.403999] xhci_hcd 0000:00:14.0: xHCI Host Controller
> [    1.404004] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 2
> [    1.404007] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
> [    1.404057] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.10
> [    1.404058] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [    1.404059] usb usb2: Product: xHCI Host Controller
> [    1.404059] usb usb2: Manufacturer: Linux 5.10.0-8parrot1-amd64 xhci-h=
cd
> [    1.404060] usb usb2: SerialNumber: 0000:00:14.0
> [    1.404189] hub 2-0:1.0: USB hub found
> [    1.404210] hub 2-0:1.0: 8 ports detected
> [    1.404303] intel-lpss 0000:00:1e.0: enabling device (0000 -> 0002)
> [    1.404454] usb: port power management may be unreliable
> [    1.404721] idma64 idma64.2: Found Intel integrated DMA 64-bit
> [    1.404884] dw-apb-uart.2: ttyS0 at MMIO 0x8f802000 (irq =3D 20, base_=
baud =3D 7500000) is a 16550A
> [    1.408398] scsi host4: ahci
> [    1.408449] ata1: DUMMY
> [    1.408450] ata2: DUMMY
> [    1.408451] ata3: DUMMY
> [    1.408452] ata4: DUMMY
> [    1.408459] ata5: SATA max UDMA/133 abar m2048@0xa4425000 port 0xa4425=
300 irq 126
> [    1.410847] nvme nvme0: Shutdown timeout set to 8 seconds
> [    1.413723] libphy: r8169: probed
> [    1.413933] r8169 0000:07:00.1 eth0: RTL8411b, 98:28:a6:45:01:2a, XID =
5c8, IRQ 130
> [    1.413935] r8169 0000:07:00.1 eth0: jumbo features [frames: 9194 byte=
s, tx checksumming: ko]
> [    1.422565] nvme nvme0: 12/0/0 default/read/poll queues
> [    1.424804]  nvme0n1: p1 p2 p3 p4 p5
> [    1.429409] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismat=
ch - Found [Buffer], ACPI requires [Package] (20200925/nsarguments-61)
> [    1.429439] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type m=
ismatch - Found [Buffer], ACPI requires [Package] (20200925/nsarguments-61)
> [    1.429912] pci 0000:01:00.0: optimus capabilities: enabled, status dy=
namic power, hda bios codec supported
> [    1.429915] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG=
0.PEGP handle
> [    1.429915] nouveau: detected PR support, will not use DSM
> [    1.429932] nouveau 0000:01:00.0: enabling device (0106 -> 0107)
> [    1.430094] checking generic (b0000000 7f0000) vs hw (a3000000 1000000=
)
> [    1.430094] checking generic (b0000000 7f0000) vs hw (90000000 1000000=
0)
> [    1.430095] checking generic (b0000000 7f0000) vs hw (a0000000 2000000=
)
> [    1.430162] nouveau 0000:01:00.0: NVIDIA GP107 (137000a1)
> [    1.449785] i915 0000:00:02.0: [drm] VT-d active for gfx access
> [    1.449787] checking generic (b0000000 7f0000) vs hw (a2000000 1000000=
)
> [    1.449788] checking generic (b0000000 7f0000) vs hw (b0000000 1000000=
0)
> [    1.449789] fb0: switching to inteldrmfb from EFI VGA
> [    1.449854] Console: switching to colour dummy device 80x25
> [    1.449873] i915 0000:00:02.0: vgaarb: deactivate vga console
> [    1.455369] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
> [    1.455395] i915 0000:00:02.0: firmware: direct-loading firmware i915/=
kbl_dmc_ver1_04.bin
> [    1.455653] i915 0000:00:02.0: [drm] Finished loading DMC firmware i91=
5/kbl_dmc_ver1_04.bin (v1.4)
> [    1.457042] nouveau 0000:01:00.0: bios: version 86.07.4f.00.1c
> [    1.457211] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/nvdec/scrubber.bin
> [    1.457249] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/acr/bl.bin
> [    1.457282] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/acr/ucode_load.bin
> [    1.457317] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/acr/unload_bl.bin
> [    1.457346] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/acr/ucode_unload.bin
> [    1.457349] nouveau 0000:01:00.0: pmu: firmware unavailable
> [    1.457492] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/fecs_bl.bin
> [    1.457505] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/fecs_inst.bin
> [    1.457513] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/fecs_data.bin
> [    1.457521] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/fecs_sig.bin
> [    1.457533] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/gpccs_bl.bin
> [    1.457542] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/gpccs_inst.bin
> [    1.457552] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/gpccs_data.bin
> [    1.457559] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/gpccs_sig.bin
> [    1.457570] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/sw_nonctx.bin
> [    1.457581] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/sw_ctx.bin
> [    1.457593] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/sw_bundle_init.bin
> [    1.457607] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/gr/sw_method_init.bin
> [    1.457626] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/sec2/sig-1.bin
> [    1.457672] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/sec2/image-1.bin
> [    1.457693] nouveau 0000:01:00.0: firmware: direct-loading firmware nv=
idia/gp107/sec2/desc-1.bin
> [    1.513522] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
> [    1.660413] usb 1-1: new high-speed USB device number 2 using xhci_hcd
> [    1.727332] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [    1.728560] ata5.00: ATA-10: TOSHIBA MQ04ABF100, JU001J, max UDMA/100
> [    1.728562] ata5.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 32=
), AA
> [    1.730185] ata5.00: configured for UDMA/100
> [    1.730303] scsi 4:0:0:0: Direct-Access     ATA      TOSHIBA MQ04ABF1 =
1J   PQ: 0 ANSI: 5
> [    1.732323] input: ELAN0504:01 04F3:3091 Mouse as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN0504:01/0018:04F3:3091.0001/inp=
ut/input5
> [    1.732396] input: ELAN0504:01 04F3:3091 Touchpad as /devices/pci0000:=
00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN0504:01/0018:04F3:3091.0001/=
input/input7
> [    1.732441] hid-generic 0018:04F3:3091.0001: input,hidraw0: I2C HID v1=
.00 Mouse [ELAN0504:01 04F3:3091] on i2c-ELAN0504:01
> [    1.732858] sd 4:0:0:0: [sda] Drive-managed SMR disk
> [    1.732862] sd 4:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.0=
0 TB/932 GiB)
> [    1.732863] sd 4:0:0:0: [sda] 4096-byte physical blocks
> [    1.732870] sd 4:0:0:0: [sda] Write Protect is off
> [    1.732871] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    1.732881] sd 4:0:0:0: [sda] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
> [    1.823881] usb 1-1: New USB device found, idVendor=3D05e3, idProduct=
=3D0610, bcdDevice=3D 4.02
> [    1.823882] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
> [    1.823883] usb 1-1: Product: USB2.0 Hub
> [    1.823884] usb 1-1: Manufacturer: GenesysLogic
> [    1.825184] hub 1-1:1.0: USB hub found
> [    1.826559] hub 1-1:1.0: 4 ports detected
> [    1.849566] [TTM] Zone  kernel: Available graphics memory: 8114708 KiB
> [    1.849567] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
> [    1.849568] [TTM] Initializing pool allocator
> [    1.849571] [TTM] Initializing DMA pool allocator
> [    1.849579] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
> [    1.849579] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
> [    1.849581] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
> [    1.849582] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
> [    1.849582] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [    1.849583] nouveau 0000:01:00.0: DRM: DCB version 4.1
> [    1.849584] nouveau 0000:01:00.0: DRM: DCB outp 00: 02022f62 00020010
> [    1.849585] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010261
> [    1.849891] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copie=
s
> [    1.888481]  sda: sda1
> [    1.888681] sd 4:0:0:0: [sda] Attached SCSI disk
> [    1.948956] usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xh=
ci_hcd
> [    1.973534] usb 2-1: New USB device found, idVendor=3D05e3, idProduct=
=3D0616, bcdDevice=3D 4.02
> [    1.973536] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
> [    1.973537] usb 2-1: Product: USB3.0 Hub
> [    1.973538] usb 2-1: Manufacturer: GenesysLogic
> [    1.975131] hub 2-1:1.0: USB hub found
> [    1.975576] hub 2-1:1.0: 4 ports detected
> [    2.075648] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x20000=
0, bo 000000006e25b24e
> [    2.096399] usb 1-5: new high-speed USB device number 3 using xhci_hcd
> [    2.128412] tsc: Refined TSC clocksource calibration: 2208.000 MHz
> [    2.128416] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1=
fd3b81b95f, max_idle_ns: 440795257325 ns
> [    2.142747] clocksource: Switched to clocksource tsc
> [    2.161917] Console: switching to colour frame buffer device 240x67
> [    2.162476] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer=
 device
> [    2.184620] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 =
on minor 1
> [    2.184623] nouveau 0000:01:00.0: DRM: Disabling PCI power management =
to avoid bug
> [    2.254190] usb 1-5: New USB device found, idVendor=3D0408, idProduct=
=3Da061, bcdDevice=3D 0.04
> [    2.254195] usb 1-5: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
> [    2.254198] usb 1-5: Product: HD User Facing
> [    2.254200] usb 1-5: Manufacturer: SunplusIT Inc
> [    2.324390] usb 1-1.1: new full-speed USB device number 4 using xhci_h=
cd
> [    2.426619] usb 1-1.1: New USB device found, idVendor=3D0c45, idProduc=
t=3D7697, bcdDevice=3D 1.00
> [    2.426624] usb 1-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
> [    2.426627] usb 1-1.1: Product: USB DEVICE
> [    2.426629] usb 1-1.1: Manufacturer: SONiX
> [    2.441500] input: SONiX USB DEVICE as /devices/pci0000:00/0000:00:14.=
0/usb1/1-1/1-1.1/1-1.1:1.0/0003:0C45:7697.0002/input/input8
> [    2.500653] hid-generic 0003:0C45:7697.0002: input,hidraw1: USB HID v1=
.11 Keyboard [SONiX USB DEVICE] on usb-0000:00:14.0-1.1/input0
> [    2.502944] input: SONiX USB DEVICE Keyboard as /devices/pci0000:00/00=
00:00:14.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:0C45:7697.0003/input/input9
> [    2.552404] usb 1-14: new full-speed USB device number 5 using xhci_hc=
d
> [    2.560504] input: SONiX USB DEVICE Wireless Radio Control as /devices=
/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:0C45:7697.0003/input=
/input10
> [    2.560591] input: SONiX USB DEVICE Consumer Control as /devices/pci00=
00:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:0C45:7697.0003/input/input=
11
> [    2.560636] input: SONiX USB DEVICE as /devices/pci0000:00/0000:00:14.=
0/usb1/1-1/1-1.1/1-1.1:1.1/0003:0C45:7697.0003/input/input12
> [    2.561005] hid-generic 0003:0C45:7697.0003: input,hiddev0,hidraw2: US=
B HID v1.11 Keyboard [SONiX USB DEVICE] on usb-0000:00:14.0-1.1/input1
> [    2.561083] usbcore: registered new interface driver usbhid
> [    2.561085] usbhid: USB HID core driver
> [    2.585955] [drm] Initialized i915 1.6.0 20200917 for 0000:00:02.0 on =
minor 0
> [    2.587603] [Firmware Bug]: ACPI(PEGP) defines _DOD but not _DOS
> [    2.587635] ACPI: Video Device [PEGP] (multi-head: yes  rom: yes  post=
: no)
> [    2.588127] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A=
08:00/device:00/LNXVIDEO:00/input/input13
> [    2.592466] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post:=
 no)
> [    2.592907] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A=
08:00/LNXVIDEO:01/input/input14
> [    2.593216] vga_switcheroo: enabled
> [    2.594123] fbcon: i915drmfb (fb1) is primary device
> [    2.594126] fbcon: Remapping primary device, fb1, to tty 1-63
> [    2.702071] usb 1-14: New USB device found, idVendor=3D8087, idProduct=
=3D0aaa, bcdDevice=3D 0.02
> [    2.702074] usb 1-14: New USB device strings: Mfr=3D0, Product=3D0, Se=
rialNumber=3D0
> [    2.780379] usb 1-1.2: new low-speed USB device number 6 using xhci_hc=
d
> [    2.884886] usb 1-1.2: New USB device found, idVendor=3D18f8, idProduc=
t=3D0f97, bcdDevice=3D 1.00
> [    2.884889] usb 1-1.2: New USB device strings: Mfr=3D0, Product=3D1, S=
erialNumber=3D0
> [    2.884891] usb 1-1.2: Product: USB OPTICAL MOUSE
> [    2.892984] input: USB OPTICAL MOUSE  as /devices/pci0000:00/0000:00:1=
4.0/usb1/1-1/1-1.2/1-1.2:1.0/0003:18F8:0F97.0004/input/input15
> [    2.893107] hid-generic 0003:18F8:0F97.0004: input,hidraw3: USB HID v1=
.10 Mouse [USB OPTICAL MOUSE ] on usb-0000:00:14.0-1.2/input0
> [    2.896868] input: USB OPTICAL MOUSE  Keyboard as /devices/pci0000:00/=
0000:00:14.0/usb1/1-1/1-1.2/1-1.2:1.1/0003:18F8:0F97.0005/input/input16
> [    2.956487] input: USB OPTICAL MOUSE  Consumer Control as /devices/pci=
0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2:1.1/0003:18F8:0F97.0005/input/inp=
ut17
> [    2.956616] hid-generic 0003:18F8:0F97.0005: input,hiddev1,hidraw4: US=
B HID v1.10 Keyboard [USB OPTICAL MOUSE ] on usb-0000:00:14.0-1.2/input1
> [    3.036367] usb 1-1.4: new high-speed USB device number 7 using xhci_h=
cd
> [    3.140414] usb 1-1.4: New USB device found, idVendor=3D05e3, idProduc=
t=3D0751, bcdDevice=3D14.04
> [    3.140417] usb 1-1.4: New USB device strings: Mfr=3D3, Product=3D4, S=
erialNumber=3D0
> [    3.140419] usb 1-1.4: Product: USB Storage
> [    3.140421] usb 1-1.4: Manufacturer: USB Storage
> [    3.146810] usb-storage 1-1.4:1.0: USB Mass Storage device detected
> [    3.147331] scsi host5: usb-storage 1-1.4:1.0
> [    3.147490] usbcore: registered new interface driver usb-storage
> [    3.149247] usbcore: registered new interface driver uas
> [    3.692837] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer devic=
e
> [    3.816331] raid6: avx2x4   gen() 37280 MB/s
> [    3.884333] raid6: avx2x4   xor() 19557 MB/s
> [    3.952328] raid6: avx2x2   gen() 44739 MB/s
> [    4.020328] raid6: avx2x2   xor() 26620 MB/s
> [    4.088348] raid6: avx2x1   gen() 37892 MB/s
> [    4.156332] raid6: avx2x1   xor() 20619 MB/s
> [    4.181691] scsi 5:0:0:0: Direct-Access     Generic  STORAGE DEVICE   =
1404 PQ: 0 ANSI: 6
> [    4.224333] raid6: sse2x4   gen() 18218 MB/s
> [    4.292333] raid6: sse2x4   xor() 10598 MB/s
> [    4.360333] raid6: sse2x2   gen() 18526 MB/s
> [    4.428341] raid6: sse2x2   xor() 11335 MB/s
> [    4.496341] raid6: sse2x1   gen() 15756 MB/s
> [    4.564342] raid6: sse2x1   xor()  7674 MB/s
> [    4.564343] raid6: using algorithm avx2x2 gen() 44739 MB/s
> [    4.564343] raid6: .... xor() 26620 MB/s, rmw enabled
> [    4.564343] raid6: using avx2x2 recovery algorithm
> [    4.564862] xor: automatically using best checksumming function   avx
> [    4.584101] Btrfs loaded, crc32c=3Dcrc32c-intel
> [    4.594999] sd 5:0:0:0: [sdb] Attached SCSI removable disk
> [    4.614588] SGI XFS with ACLs, security attributes, realtime, quota, n=
o debug enabled
> [    4.624775] async_tx: api initialized (async)
> [    5.070024] BTRFS: device fsid efd4b6b0-1a18-466d-b365-d62deb587b54 de=
vid 1 transid 10744 /dev/nvme0n1p5 scanned by btrfs (362)
> [    5.108257] BTRFS info (device nvme0n1p5): disk space caching is enabl=
ed
> [    5.108260] BTRFS info (device nvme0n1p5): has skinny extents
> [    5.118259] BTRFS info (device nvme0n1p5): enabling ssd optimizations
> [    5.174720] Not activating Mandatory Access Control as /sbin/tomoyo-in=
it does not exist.
> [    5.241771] systemd[1]: Inserted module 'autofs4'
> [    5.366289] systemd[1]: systemd 247.3-6 running in system mode. (+PAM =
+AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYP=
T +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +P=
CRE2 default-hierarchy=3Dunified)
> [    5.384578] systemd[1]: Detected architecture x86-64.
> [    5.384862] systemd[1]: Set hostname to <pc>.
> [    5.465450] systemd[1]: /lib/systemd/system/plymouth-start.service:16:=
 Unit configured to use KillMode=3Dnone. This is unsafe, as it disables sys=
temd's process lifecycle management for the service. Please update your ser=
vice to use a safer KillMode=3D, such as 'mixed' or 'control-group'. Suppor=
t for KillMode=3Dnone is deprecated and will eventually be removed.
> [    5.475853] systemd[1]: Queued start job for default target Graphical =
Interface.
> [    5.476471] systemd[1]: Created slice system-getty.slice.
> [    5.476623] systemd[1]: Created slice system-modprobe.slice.
> [    5.476789] systemd[1]: Created slice system-systemd\x2dfsck.slice.
> [    5.476898] systemd[1]: Created slice User and Session Slice.
> [    5.476943] systemd[1]: Started Forward Password Requests to Wall Dire=
ctory Watch.
> [    5.477049] systemd[1]: Set up automount Arbitrary Executable File For=
mats File System Automount Point.
> [    5.477096] systemd[1]: Reached target User and Group Name Lookups.
> [    5.477107] systemd[1]: Reached target Remote File Systems.
> [    5.477116] systemd[1]: Reached target Slices.
> [    5.477129] systemd[1]: Reached target Swap.
> [    5.477179] systemd[1]: Listening on Device-mapper event daemon FIFOs.
> [    5.477248] systemd[1]: Listening on LVM2 poll daemon socket.
> [    5.477491] systemd[1]: Listening on Syslog Socket.
> [    5.477724] systemd[1]: Listening on fsck to fsckd communication Socke=
t.
> [    5.477761] systemd[1]: Listening on initctl Compatibility Named Pipe.
> [    5.477868] systemd[1]: Listening on Journal Audit Socket.
> [    5.477934] systemd[1]: Listening on Journal Socket (/dev/log).
> [    5.478009] systemd[1]: Listening on Journal Socket.
> [    5.478099] systemd[1]: Listening on udev Control Socket.
> [    5.478166] systemd[1]: Listening on udev Kernel Socket.
> [    5.478613] systemd[1]: Mounting Huge Pages File System...
> [    5.479058] systemd[1]: Mounting POSIX Message Queue File System...
> [    5.479550] systemd[1]: Mounting Kernel Debug File System...
> [    5.479998] systemd[1]: Mounting Kernel Trace File System...
> [    5.480104] systemd[1]: Finished Availability of block devices.
> [    5.480935] systemd[1]: Starting Set the console keyboard layout...
> [    5.481423] systemd[1]: Starting Create list of static device nodes fo=
r the current kernel...
> [    5.481857] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots=
 etc. using dmeventd or progress polling...
> [    5.482320] systemd[1]: Starting Load Kernel Module configfs...
> [    5.482821] systemd[1]: Starting Load Kernel Module drm...
> [    5.483297] systemd[1]: Starting Load Kernel Module fuse...
> [    5.483753] systemd[1]: Started Nameserver information manager.
> [    5.483841] systemd[1]: Reached target Network (Pre).
> [    5.484194] systemd[1]: Condition check resulted in Set Up Additional =
Binary Formats being skipped.
> [    5.484222] systemd[1]: Condition check resulted in File System Check =
on Root Device being skipped.
> [    5.485304] systemd[1]: Starting Journal Service...
> [    5.485930] systemd[1]: Starting Load Kernel Modules...
> [    5.486416] systemd[1]: Starting Remount Root and Kernel File Systems.=
..
> [    5.486990] systemd[1]: Starting Coldplug All udev Devices...
> [    5.487550] fuse: init (API version 7.32)
> [    5.488096] systemd[1]: Starting Uncomplicated firewall...
> [    5.489832] systemd[1]: Mounted Huge Pages File System.
> [    5.489943] systemd[1]: Mounted POSIX Message Queue File System.
> [    5.490036] systemd[1]: Mounted Kernel Debug File System.
> [    5.490123] systemd[1]: Mounted Kernel Trace File System.
> [    5.490406] systemd[1]: Finished Set the console keyboard layout.
> [    5.490686] systemd[1]: Finished Create list of static device nodes fo=
r the current kernel.
> [    5.490902] systemd[1]: modprobe@configfs.service: Succeeded.
> [    5.491069] systemd[1]: Finished Load Kernel Module configfs.
> [    5.491319] systemd[1]: modprobe@drm.service: Succeeded.
> [    5.491500] systemd[1]: Finished Load Kernel Module drm.
> [    5.491724] systemd[1]: modprobe@fuse.service: Succeeded.
> [    5.491895] systemd[1]: Finished Load Kernel Module fuse.
> [    5.492389] systemd[1]: Finished Uncomplicated firewall.
> [    5.493400] systemd[1]: Mounting FUSE Control File System...
> [    5.494190] systemd[1]: Mounting Kernel Configuration File System...
> [    5.494546] BTRFS info (device nvme0n1p5): setting nodatacow, compress=
ion disabled
> [    5.494549] BTRFS info (device nvme0n1p5): enabling auto defrag
> [    5.494550] BTRFS info (device nvme0n1p5): disk space caching is enabl=
ed
> [    5.496807] systemd[1]: Finished Remount Root and Kernel File Systems.
> [    5.496995] systemd[1]: Mounted FUSE Control File System.
> [    5.497106] systemd[1]: Mounted Kernel Configuration File System.
> [    5.497675] systemd[1]: Condition check resulted in Rebuild Hardware D=
atabase being skipped.
> [    5.497709] systemd[1]: Condition check resulted in Platform Persisten=
t Storage Archival being skipped.
> [    5.498126] lp: driver loaded but no devices found
> [    5.498250] systemd[1]: Starting Load/Save Random Seed...
> [    5.498817] systemd[1]: Starting Create System Users...
> [    5.500175] ppdev: user-space parallel port driver
> [    5.502759] systemd[1]: Finished Load Kernel Modules.
> [    5.503313] systemd[1]: Starting Apply Kernel Variables...
> [    5.508755] systemd[1]: Finished Create System Users.
> [    5.509289] systemd[1]: Starting Create Static Device Nodes in /dev...
> [    5.509513] systemd[1]: Finished Apply Kernel Variables.
> [    5.509722] systemd[1]: Finished Load/Save Random Seed.
> [    5.509807] systemd[1]: Condition check resulted in First Boot Complet=
e being skipped.
> [    5.515390] systemd[1]: Finished Create Static Device Nodes in /dev.
> [    5.516348] systemd[1]: Starting Rule-based Manager for Device Events =
and Files...
> [    5.551078] systemd[1]: Started Journal Service.
> [    5.555306] systemd-journald[461]: Received client request to flush ru=
ntime journal.
> [    5.608895] input: Acer Wireless Radio Control as /devices/LNXSYSTM:00=
/10251229:00/input/input19
> [    5.609963] intel_pmc_core INT33A1:00:  initialized
> [    5.625179] ACPI: AC Adapter [ACAD] (on-line)
> [    5.677425] sd 4:0:0:0: Attached scsi generic sg0 type 0
> [    5.677463] sd 5:0:0:0: Attached scsi generic sg1 type 0
> [    5.679306] mc: Linux media interface: v0.10
> [    5.681032] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
> [    5.697959] iTCO_vendor_support: vendor-support=3D0
> [    5.697997] videodev: Linux video capture interface: v2.00
> [    5.702979] acer_wmi: Acer Laptop ACPI-WMI Extras
> [    5.703004] acer_wmi: Function bitmap for Communication Button: 0x801
> [    5.703170] cfg80211: Loading compiled-in X.509 certificates for regul=
atory database
> [    5.711276] cfg80211: Loaded X.509 cert 'benh@debian.org: 577e021cb980=
e0e820821ba7b54b4961b8b4fadf'
> [    5.711367] input: PC Speaker as /devices/platform/pcspkr/input/input2=
0
> [    5.711485] alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
> [    5.711599] cfg80211: Loaded X.509 cert 'romain.perier@gmail.com: 3abb=
c6ec146e09d1b6016ab9d6cf71dd233f0328'
> [    5.711937] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    5.711967] ee1004 0-0050: 512 byte EE1004-compliant SPD EEPROM, read-=
only
> [    5.717918] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [    5.717975] iTCO_wdt: Found a Intel PCH TCO device (Version=3D6, TCOBA=
SE=3D0x0400)
> [    5.718078] input: Acer WMI hotkeys as /devices/virtual/input/input21
> [    5.718137] iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=3D0)
> [    5.721049] platform regulatory.0: firmware: direct-loading firmware r=
egulatory.db
> [    5.721297] platform regulatory.0: firmware: direct-loading firmware r=
egulatory.db.p7s
> [    5.753323] pstore: Using crash dump compression: deflate
> [    5.753337] pstore: Registered efi as persistent store backend
> [    5.759295] Intel(R) Wireless WiFi driver for Linux
> [    5.778440] iwlwifi 0000:00:14.3: firmware: direct-loading firmware iw=
lwifi-9000-pu-b0-jf-b0-46.ucode
> [    5.778455] iwlwifi 0000:00:14.3: WRT: Overriding region id 0
> [    5.778456] iwlwifi 0000:00:14.3: WRT: Overriding region id 1
> [    5.778456] iwlwifi 0000:00:14.3: WRT: Overriding region id 2
> [    5.778457] iwlwifi 0000:00:14.3: WRT: Overriding region id 3
> [    5.778458] iwlwifi 0000:00:14.3: WRT: Overriding region id 4
> [    5.778459] iwlwifi 0000:00:14.3: WRT: Overriding region id 6
> [    5.778459] iwlwifi 0000:00:14.3: WRT: Overriding region id 8
> [    5.778460] iwlwifi 0000:00:14.3: WRT: Overriding region id 9
> [    5.778460] iwlwifi 0000:00:14.3: WRT: Overriding region id 10
> [    5.778461] iwlwifi 0000:00:14.3: WRT: Overriding region id 11
> [    5.778461] iwlwifi 0000:00:14.3: WRT: Overriding region id 15
> [    5.778462] iwlwifi 0000:00:14.3: WRT: Overriding region id 16
> [    5.778463] iwlwifi 0000:00:14.3: WRT: Overriding region id 18
> [    5.778463] iwlwifi 0000:00:14.3: WRT: Overriding region id 19
> [    5.778464] iwlwifi 0000:00:14.3: WRT: Overriding region id 20
> [    5.778464] iwlwifi 0000:00:14.3: WRT: Overriding region id 21
> [    5.778465] iwlwifi 0000:00:14.3: WRT: Overriding region id 28
> [    5.778645] iwlwifi 0000:00:14.3: loaded firmware version 46.6f9f215c.=
0 9000-pu-b0-jf-b0-46.ucode op_mode iwlmvm
> [    5.778662] iwlwifi 0000:00:14.3: firmware: failed to load iwl-debug-y=
oyo.bin (-2)
> [    5.778663] firmware_class: See https://wiki.debian.org/Firmware for i=
nformation about missing firmware
> [    5.799802] uvcvideo: Found UVC 1.00 device HD User Facing (0408:a061)
> [    5.805082] wl: loading out-of-tree module taints kernel.
> [    5.805087] wl: module license 'MIXED/Proprietary' taints kernel.
> [    5.805088] Disabling lock debugging due to kernel taint
> [    5.814820] RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 6553=
60 ms ovfl timer
> [    5.814822] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
> [    5.814823] RAPL PMU: hw unit of domain package 2^-14 Joules
> [    5.814824] RAPL PMU: hw unit of domain dram 2^-14 Joules
> [    5.814824] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
> [    5.817265] input: HD User Facing: HD User Facing as /devices/pci0000:=
00/0000:00:14.0/usb1/1-5/1-5:1.0/input/input22
> [    5.827289] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_a=
udio_component_bind_ops [i915])
> [    5.827535] snd_hda_intel 0000:01:00.1: Disabling MSI
> [    5.827542] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio cl=
ient
> [    5.828795] Bluetooth: Core ver 2.22
> [    5.828809] NET: Registered protocol family 31
> [    5.828810] Bluetooth: HCI device and connection manager initialized
> [    5.828813] Bluetooth: HCI socket layer initialized
> [    5.828815] Bluetooth: L2CAP socket layer initialized
> [    5.828817] Bluetooth: SCO socket layer initialized
> [    5.860441] usbcore: registered new interface driver uvcvideo
> [    5.860444] USB Video Class driver (1.1.1)
> [    5.870460] input: ELAN0504:01 04F3:3091 Mouse as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN0504:01/0018:04F3:3091.0001/inp=
ut/input23
> [    5.870549] input: ELAN0504:01 04F3:3091 Touchpad as /devices/pci0000:=
00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN0504:01/0018:04F3:3091.0001/=
input/input25
> [    5.870624] hid-multitouch 0018:04F3:3091.0001: input,hidraw0: I2C HID=
 v1.00 Mouse [ELAN0504:01 04F3:3091] on i2c-ELAN0504:01
> [    5.928548] iwlwifi 0000:00:14.3: Detected Intel(R) Wireless-AC 9560 1=
60MHz, REV=3D0x318
> [    5.935742] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops nv50_a=
udio_component_bind_ops [nouveau])
> [    5.938881] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/0=
000:00:01.0/0000:01:00.1/sound/card1/input26
> [    5.938921] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/0=
000:00:01.0/0000:01:00.1/sound/card1/input27
> [    5.938968] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/0=
000:00:01.0/0000:01:00.1/sound/card1/input28
> [    5.939043] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/0=
000:00:01.0/0000:01:00.1/sound/card1/input29
> [    5.961401] audit: type=3D1400 audit(1631182768.326:2): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"klogd" pid=
=3D706 comm=3D"apparmor_parser"
> [    5.962764] audit: type=3D1400 audit(1631182768.326:3): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/ma=
n" pid=3D713 comm=3D"apparmor_parser"
> [    5.962769] audit: type=3D1400 audit(1631182768.326:4): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filter"=
 pid=3D713 comm=3D"apparmor_parser"
> [    5.962772] audit: type=3D1400 audit(1631182768.326:5): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff" =
pid=3D713 comm=3D"apparmor_parser"
> [    5.963242] audit: type=3D1400 audit(1631182768.326:6): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modp=
robe" pid=3D705 comm=3D"apparmor_parser"
> [    5.963245] audit: type=3D1400 audit(1631182768.326:7): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modp=
robe//kmod" pid=3D705 comm=3D"apparmor_parser"
> [    5.963246] audit: type=3D1400 audit(1631182768.326:8): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"system_tor"=
 pid=3D710 comm=3D"apparmor_parser"
> [    5.963510] audit: type=3D1400 audit(1631182768.326:9): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"lsb_release=
" pid=3D704 comm=3D"apparmor_parser"
> [    5.964700] audit: type=3D1400 audit(1631182768.330:10): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/i=
rssi" pid=3D712 comm=3D"apparmor_parser"
> [    5.964704] audit: type=3D1400 audit(1631182768.330:11): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"syslogd" p=
id=3D708 comm=3D"apparmor_parser"
> [    5.981448] iwlwifi 0000:00:14.3: base HW address: a4:c3:f0:47:4c:c6
> [    5.984711] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC255: =
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [    5.984715] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x=
0/0x0/0x0/0x0/0x0)
> [    5.984717] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x21/0x=
0/0x0/0x0/0x0)
> [    5.984719] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
> [    5.984720] snd_hda_codec_realtek hdaudioC0D0:    inputs:
> [    5.984723] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=3D0x19
> [    5.984725] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=3D0x1=
2
> [    6.049992] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-r=
s'
> [    6.050154] thermal thermal_zone2: failed to read out thermal zone (-6=
1)
> [    6.072531] usbcore: registered new interface driver btusb
> [    6.077722] Bluetooth: hci0: Firmware revision 0.1 build 168 week 48 2=
020
> [    6.157150] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
> [    6.237359] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [    6.237361] Bluetooth: BNEP filters: protocol multicast
> [    6.237365] Bluetooth: BNEP socket layer initialized
> [    6.238030] Initializing XFRM netlink socket
> [    6.242913] NET: Registered protocol family 38
> [    6.448651] r8169 0000:07:00.1: firmware: direct-loading firmware rtl_=
nic/rtl8411-2.fw
> [    6.480401] Generic FE-GE Realtek PHY r8169-701:00: attached PHY drive=
r [Generic FE-GE Realtek PHY] (mii_bus:phy_addr=3Dr8169-701:00, irq=3DIGNOR=
E)
> [    6.506167] intel_rapl_common: Found RAPL domain package
> [    6.506173] intel_rapl_common: Found RAPL domain core
> [    6.506177] intel_rapl_common: Found RAPL domain uncore
> [    6.506180] intel_rapl_common: Found RAPL domain dram
> [    6.578370] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1=
f.3/sound/card0/input30
> [    6.578420] input: HDA Intel PCH Front Headphone as /devices/pci0000:0=
0/0000:00:1f.3/sound/card0/input31
> [    6.680464] r8169 0000:07:00.1 eth0: Link is Down
> [    6.683335] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> [    8.168344] r8169 0000:07:00.1 eth0: Link is Up - 100Mbps/Full - flow =
control rx/tx
> [    8.168362] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> [    9.393584] Bluetooth: RFCOMM TTY layer initialized
> [    9.393587] Bluetooth: RFCOMM socket layer initialized
> [    9.393593] Bluetooth: RFCOMM ver 1.11
>
>
>
>
> I beg you pls  help me solve this problem, i will show you the output of =
any commands if necessary, sorry for bad english.

